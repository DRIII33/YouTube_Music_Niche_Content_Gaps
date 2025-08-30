Here’s the content fully structured and formatted in **Markdown** for GitHub:

---

# **YouTube Music Content Gaps: Niche Genre Prioritization**

This project provides a **data-driven solution** for the **YouTube Music Content Operations (MCO)** team to identify and prioritize high-value content gaps. By analyzing user listening and engagement data for **unlicensed artists**, this project moves beyond simple metrics to provide a **robust prioritization framework** that helps the MCO team make **strategic, data-informed decisions**.

---

## **Methodology & Analysis**

The core of this project is a **two-step data pipeline implemented in Google BigQuery**:

### **1. Data Preparation (`vw_unlicensed_listening_data`)**

* The raw `user_listening_data` was joined with a `licensed_catalog_data` table.
* A **SQL view** was created to **filter out any artists that are already licensed**, ensuring the analysis focuses exclusively on **true content gaps**.
* This step was critical for the project's **accuracy**.

### **2. Modeling & Prioritization (`vw_prioritized_artists`)**

A second BigQuery view was built on top of the clean, unlicensed data. This view implements the **prioritization model** by:

* **Aggregating listening sessions** and calculating **average engagement scores** for each artist.
* **Normalizing both metrics** to a scale of **0 to 1**.
* Creating a final **`priority_score`** using a **weighted average**:

  * **60%** → normalized listening sessions
  * **40%** → normalized engagement

This model ensures that **artists with both high listening volume and high user engagement receive the highest score**.

---

## **Looker Studio Dashboard & Business Impact**

The insights from the model are visualized in a **Looker Studio dashboard** designed for a **business audience**. The dashboard's key findings directly address the **business problem**:

### **Executive Summary (Page 1)**

* **Top 50 Artists to Acquire**

  * A table providing the MCO team with an **immediate, actionable list**.
  * **Sorted by `priority_score`**, so the highest-potential artists appear first.
* **Underserved Genres by Listening Volume**

  * A **bar chart** revealing significant market opportunities in **niche genres** such as **Ambient** and **Folk**.

### **Prioritization Insights (Page 2)**

* **Priority Analysis: Content Gaps by Genre & Engagement**

  * A **stacked bar chart** that explains the **“why” behind the rankings**.
  * Breaks down **average engagement scores per genre**, showing the **individual artists driving engagement**.
  * This enables the MCO team to **see the true composition of a content gap**, making acquisition efforts **precise and strategic**.

---
