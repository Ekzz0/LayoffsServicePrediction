import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


def plot_feature_importance(importance: list[float], names: list[str], model_type: str):
    # Create arrays from feature importance and feature names
    feature_importance = np.array(importance)
    feature_names = np.array(names)

    # Create a DataFrame using a Dictionary
    data = {'feature_names': feature_names, 'feature_importance': feature_importance}
    fi_df = pd.DataFrame(data)

    # Sort the DataFrame in order decreasing feature importance
    fi_df.sort_values(by=['feature_importance'], ascending=False, inplace=True)

    # Define size of bar plot
    plt.figure(figsize=(6, 4))
    # Plot Searborn bar chart
    sns.barplot(x=fi_df['feature_importance'], y=fi_df['feature_names'])
    # Add chart labels
    plt.title(model_type + ' FEATURE IMPORTANCE')
    plt.xlabel('FEATURE IMPORTANCE')
    plt.ylabel('FEATURE NAMES')


def plot_metrics_hist(models_names: list[str], metrics: list[float]):
    fig, ax = plt.subplots(figsize=(5, 5), nrows=1, ncols=1)
    col_map = plt.get_cmap('Paired')
    ax.bar(models_names, metrics, color=col_map.colors, edgecolor='k')
    plt.grid(color='r', linestyle='--', linewidth=1)
    ax.set_title("Распределение ROC_AUC_SCORE по моделям")
    ax.set_xlabel("Модель")
    ax.set_ylabel("ROC_AUC_SCORE")
    fig.set_figwidth(10)  # ширина Figure
    plt.ylim(min(metrics) * 0.90, max(metrics) * 1.03)



