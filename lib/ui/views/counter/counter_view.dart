import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_viewmodel.dart';

class CounterView extends StackedView<CounterViewModel> {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CounterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .center,
            children: [
              Text(
                'Counter is: ${viewModel.counter}',
                style: const TextStyle(fontWeight: .bold, fontSize: 18),
              ),

              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: viewModel.decrement,
                        label: const Text('Decrement'),
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: viewModel.increment,
                        label: const Text('Increment'),
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CounterViewModel viewModelBuilder(BuildContext context) => CounterViewModel();
}
