package ${packageName}

class ${viewModelClass}{
    val dummyDataLive = SingleLiveEvent<List<${itemAdapterClass}.DummyData>>()

    fun createDummyData() {
        val data: ArrayList<${itemAdapterClass}.DummyData> = ArrayList()
        for (i in 0 until 10) {
            data.add(${itemAdapterClass}.DummyData("Lorem ipsum dolor sit amet."))
        }
        dummyDataLive.value = data
    }
}