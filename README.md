# SentimentAnalysis

CoreML & CreateML Practice using [Twitter Sentimental Analysis](https://www.kaggle.com/datasets/jp797498e/twitter-entity-sentiment-analysis)

# Training Data Classification

```.csv -> .txt```

```Python
import os
import csv
import shutil

csv_file_path = "input path"

output_folder = "ouput path"

folders = ["Negative", "Neutral", "Irrelevant", "Positive"]

for folder in folders:
    folder_path = os.path.join(output_folder, folder)
    os.makedirs(folder_path, exist_ok=True)

with open(csv_file_path, "r") as csv_file:
    csv_reader = csv.reader(csv_file)
    next(csv_reader)
    
    for row in csv_reader:
        emotion = row[2]
        text_content = row[3]

        if emotion in folders:
            folder_path = os.path.join(output_folder, emotion)
            file_name = f"{emotion}_{len(os.listdir(folder_path)) + 1}.txt"
            file_path = os.path.join(folder_path, file_name)

            with open(file_path, "w") as txt_file:
                txt_file.write(text_content)

print("End")
```

# Testing Data Classification

Before securing validation...

# Action

https://github.com/zxcvb2002/SentimentAnalysis/assets/122873008/a79fc41a-6b9e-4716-a677-59f61da339ef

# Reference

[LinkedIn](https://www.linkedin.com/pulse/sentiment-analysis-coreml-filemaker-free-add-on-cris-ippolite/?trk=articles_directory)
