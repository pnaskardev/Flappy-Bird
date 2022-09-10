class Restart
{
  showDialog
            (
              context: context, builder: (BuildContext context)
              {
                return AlertDialog
                (
                  backgroundColor: Colors.brown,
                  title: Center
                  (
                    child: Text('G A M E   O V E R', style:Theme.of(context).textTheme.bodyLarge!.apply(color:Colors.white)),
                  ),
                  actions: 
                  [
                    GestureDetector
                    (
                      onTap: ()
                      {
                        Provider.of<Data>(context,listen: false).resetGame();
                      },
                      child: ClipRRect
                      (
                        borderRadius: BorderRadius.circular(5),
                        child: Center
                        (
                          child: Container
                          (
                            padding: const EdgeInsets.all(7),
                            color: Colors.white,
                            child: Text('PLAY AGAIN',style:Theme.of(context).textTheme.bodyLarge!.apply(color:Colors.brown)),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
            );
}