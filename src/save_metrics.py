import csv
import os
from datetime import datetime

def save_metrics(dataset, split, model, r2, rmse, n_train, n_test, seed=42):
    """
    Append a row of metrics to metrics/metrics.csv
    """
    os.makedirs("metrics", exist_ok=True)
    filepath = os.path.join("metrics", "metrics.csv")

    row = {
        "run_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "dataset": dataset,
        "split": split,
        "model": model,
        "r2": round(r2, 4),
        "rmse": round(rmse, 4),
        "n_train": n_train,
        "n_test": n_test,
        "seed": seed,
    }

    # If file doesn't exist, write header first
    file_exists = os.path.isfile(filepath)

    with open(filepath, mode="a", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=row.keys())
        if not file_exists:
            writer.writeheader()
        writer.writerow(row)

    print(f"✅ Metrics saved to {filepath}: {row}")
