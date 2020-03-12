from s2s.core.build_model import build_model
from s2s.env.treasure_game.treasure_game import TreasureGame

if __name__ == '__main__':

    env = TreasureGame()
    domain, problem = build_model(env,
                                  save_dir='../temp',
                                  n_jobs=8,
                                  seed=0,
                                  max_precondition_samples=10000,
                                  visualise=True,
                                  verbose=True)
    print(domain)
    print(problem)
