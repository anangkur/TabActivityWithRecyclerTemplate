<?xml version="1.0" encoding="utf-8"?>
<layout
    xmlns:android="http://schemas.android.com/apk/res/android">
    <data>

    </data>
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent">
        <android.support.v4.widget.SwipeRefreshLayout
            android:id="@+id/swipe"
            android:layout_width="match_parent"
            android:layout_height="match_parent">
            <android.support.v7.widget.RecyclerView
                android:id="@+id/recycler"
                android:layout_width="match_parent"
                android:layout_height="match_parent">

            </android.support.v7.widget.RecyclerView>
        </android.support.v4.widget.SwipeRefreshLayout>
    </LinearLayout>
</layout>