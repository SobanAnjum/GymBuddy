import 'package:flutter/material.dart';
import 'package:my_trainer/components/logoImage.dart';
import 'package:my_trainer/providerclasses/muscleDataprovider.dart';
import 'package:provider/provider.dart';

class ExcerciseSelectionScreen extends StatefulWidget {
  const ExcerciseSelectionScreen({super.key});

  @override
  State<ExcerciseSelectionScreen> createState() => _ExcerciseSelectionScreenState();
}

class _ExcerciseSelectionScreenState extends State<ExcerciseSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MuscleData>(builder: (context, provider, child) => DefaultTabController(
      length: 7,
       


      child: Scaffold(
        appBar: AppBar(
          title:const Text('Select your Excercises'),
          centerTitle: true, 
          backgroundColor: const Color.fromRGBO(100, 10, 0, 1),
        ),

        body:  Column(
          children: [
            const TabBar(
              tabAlignment: TabAlignment.start,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              tabs: 
                [
                Tab(
                    child: Text('Abs'),
                  ),
                  Tab(
                    child: Text('Back'),
                  ),
                  Tab(
                    child: Text('Chest'),
                  ),
                  Tab(
                    child: Text('Bicep'),
                  ),
                  Tab(
                    child: Text('Tricep'),
                  ),
                  Tab(
                    child: Text('Foraarms'),
                  ),
                  Tab(
                    child: Text('Legs'),
                  ),
                ]
                ),
                Expanded(
                  child: TabBarView(children: [
                  
                    Container(
                      child: ListView.builder(itemCount:provider.muscleExerciseGetter('Abs').length  ,itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(provider.muscleExerciseGetter('Abs')[index]),
                              enabled:provider.valueProvider(provider.muscleExerciseGetter('Abs')[index]),
                              
                              trailing: Checkbox(
                                value: provider.valueProvider(provider.muscleExerciseGetter('Abs')[index]),
                                onChanged:(value) 
                                {
                                  setState(() {
                                     provider.excerciseHandler(value??false, provider.muscleExerciseGetter('Abs')[index]);
                                  });
                                  
                            
                                 }
                                ),
                            ),
                          ),
                        );
                        
                      },),
                    ),
                    Container(
                      child: ListView.builder(itemCount:provider.muscleExerciseGetter('Back').length  ,itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(provider.muscleExerciseGetter('Back')[index]),
                              enabled:provider.valueProvider(provider.muscleExerciseGetter('Back')[index]),
                              
                              trailing: Checkbox(
                                value: provider.valueProvider(provider.muscleExerciseGetter('Back')[index]),
                                onChanged:(value) 
                                {
                                  setState(() {
                                     provider.excerciseHandler(value??false, provider.muscleExerciseGetter('Back')[index]);
                                  });
                                  
                            
                                 }
                                ),
                            ),
                          ),
                        );
                        
                      },),
                    ),
                    Container(
                      child: ListView.builder(itemCount:provider.muscleExerciseGetter('Chest').length  ,itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(provider.muscleExerciseGetter('Chest')[index]),
                              enabled:provider.valueProvider(provider.muscleExerciseGetter('Chest')[index]),
                              
                              trailing: Checkbox(
                                value: provider.valueProvider(provider.muscleExerciseGetter('Chest')[index]),
                                onChanged:(value) 
                                {
                                  setState(() {
                                     provider.excerciseHandler(value??false, provider.muscleExerciseGetter('Chest')[index]);
                                  });
                                  
                            
                                 }
                                ),
                            ),
                          ),
                        );
                        
                      },),
                    ),
                    Container(
                     child: ListView.builder(itemCount:provider.muscleExerciseGetter('Bicep').length  ,itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(provider.muscleExerciseGetter('Bicep')[index]),
                              enabled:provider.valueProvider(provider.muscleExerciseGetter('Bicep')[index]),
                              
                              trailing: Checkbox(
                                value: provider.valueProvider(provider.muscleExerciseGetter('Bicep')[index]),
                                onChanged:(value) 
                                {
                                  setState(() {
                                     provider.excerciseHandler(value??false, provider.muscleExerciseGetter('Bicep')[index]);
                                  });
                                  
                            
                                 }
                                ),
                            ),
                          ),
                        );
                        
                      },),
                    ),
                    Container(
                      child: ListView.builder(itemCount:provider.muscleExerciseGetter('Tricep').length  ,itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(provider.muscleExerciseGetter('Tricep')[index]),
                              enabled:provider.valueProvider(provider.muscleExerciseGetter('Tricep')[index]),
                              
                              trailing: Checkbox(
                                value: provider.valueProvider(provider.muscleExerciseGetter('Tricep')[index]),
                                onChanged:(value) 
                                {
                                  setState(() {
                                     provider.excerciseHandler(value??false, provider.muscleExerciseGetter('Tricep')[index]);
                                  });
                                  
                            
                                 }
                                ),
                            ),
                          ),
                        );
                        
                      },),
                    ),
                    Container(
                      child: ListView.builder(itemCount:provider.muscleExerciseGetter('Forearms').length  ,itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(provider.muscleExerciseGetter('Forearms')[index]),
                              enabled:provider.valueProvider(provider.muscleExerciseGetter('Forearms')[index]),
                              
                              trailing: Checkbox(
                                value: provider.valueProvider(provider.muscleExerciseGetter('Forearms')[index]),
                                onChanged:(value) 
                                {
                                  setState(() {
                                     provider.excerciseHandler(value??false, provider.muscleExerciseGetter('Forearms')[index]);
                                  });
                                  
                            
                                 }
                                ),
                            ),
                          ),
                        );
                        
                      },),
                    ),
                    Container(
                      child: ListView.builder(itemCount:provider.muscleExerciseGetter('Legs').length  ,itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(provider.muscleExerciseGetter('Legs')[index]),
                              enabled:provider.valueProvider(provider.muscleExerciseGetter('Legs')[index]),
                              
                              trailing: Checkbox(
                                value: provider.valueProvider(provider.muscleExerciseGetter('Legs')[index]),
                                onChanged:(value) 
                                {
                                  setState(() {
                                     provider.excerciseHandler(value??false, provider.muscleExerciseGetter('Legs')[index]);
                                  });
                                  
                            
                                 }
                                ),
                            ),
                          ),
                        );
                        
                      },),
                    ),
                  ]),
                )
                
             
            

          ],
        ),


        )
        )
        );

    
  }
}