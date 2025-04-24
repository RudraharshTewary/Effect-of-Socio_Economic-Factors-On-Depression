data {
  int<lower=0> N;
  int<lower=1,upper=10> Educ[N];
  int<lower=1,upper=5> Race[N];
  int sleep[N];
  int<lower=0,upper=1> modex_2[N];
  int<lower=0,upper=1> modex_3[N];
  int<lower=0,upper=1> modex_4[N];
  int<lower=0,upper=1> modex_5[N];
  int<lower=0,upper=1> modex_6[N];
  int<lower=0,upper=1> modex_7[N];
  int<lower=0,upper=1> smoke_2[N];
  int<lower=0,upper=1> smoke_4[N];
  int<lower=0,upper=1> smoke_5[N];
  int<lower=0,upper=1> y[N];
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real alpha;
  vector[10] beta_Educ;
  vector[5] beta_Race;
  real beta_sleep;
  vector[6] beta_modex;
  vector[3] beta_smoke;
  real<lower=0> sigma_educ;
  real<lower=0> sigma_race;
}

transformed parameters{
  real theta[N];
  for (i in 1:N) {                                      
    theta[i] = alpha + beta_Educ[Educ[i]] + beta_modex[1]*modex_2[i] + beta_modex[2]*modex_3[i] + beta_modex[3]*modex_4[i] + beta_modex[4]*modex_5[i] + beta_modex[5]*modex_6[i] + beta_modex[6]*modex_7[i] + beta_Race[Race[i]] + beta_sleep*sleep[i] + beta_smoke[1]*smoke_2[i] + beta_smoke[2]*smoke_4[i] + beta_smoke[3]*smoke_5[i];
  }
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  alpha ~ normal(0,1);
  beta_Educ ~ normal(0,sigma_educ);
  beta_Race ~ normal(0,sigma_race);
  beta_sleep ~ normal(0,1);
  beta_modex ~ normal(0,1);
  beta_smoke ~ normal(0,1);
  sigma_educ ~ normal(0,1);
  sigma_race ~ normal(0,1);
  
  y ~ bernoulli_logit(theta);
}
generated quantities {
  vector[N] log_lik;
  int<lower=0, upper=1> y_pred[N];
  for (i in 1:N) {
    log_lik[i] = bernoulli_logit_lpmf(y[i] | theta[i]);  
    y_pred[i] = bernoulli_rng(inv_logit(theta[i])); 
  }
}