import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_companion/backend/backend.dart';
import 'package:shopping_companion/flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/nav/serialization_util.dart';
import 'incremetal_widget.dart';

class CardListWidget extends StatefulWidget {
  late List<ProductsRecord> cartList;
  Function(int) onIncrement;
  Function(int) onDecrement;

  Function(List<ProductsRecord>) onDelete;

  Stream<int> countBtnSream;

  CardListWidget(this.cartList, this.countBtnSream,
      {required this.onIncrement,
      required this.onDecrement,
      required this.onDelete});

  @override
  CardListWidgetState createState() {
    return new CardListWidgetState();
  }
}

int ContainerIndex = 0;

class CardListWidgetState extends State<CardListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'product',
          queryParams: {
            'productSelection': serializeParam(
              widget.cartList.elementAt(ContainerIndex),
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'productSelection': widget.cartList.first,
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      },
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: widget.cartList.length,
        itemBuilder: (context, mainContainerIndex) {
          ContainerIndex = mainContainerIndex;
          final mainContainerItemRecord = widget.cartList[mainContainerIndex];
          print(widget.countBtnSream.first);
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 129.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3A000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  mainContainerItemRecord.image ?? "",
                                  width: 74,
                                  height: 74,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.ac_unit),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mainContainerItemRecord.name ?? "",
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                              width: 130,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 1,
                                                ),
                                              ),
                                              child: IncrementalWidget(
                                                widget.countBtnSream,
                                                onUpdate: (isIncrement) {
                                                  if (isIncrement) {
                                                    widget.onIncrement.call(
                                                        mainContainerIndex);
                                                  } else {
                                                    widget.onDecrement.call(
                                                        mainContainerIndex);
                                                  }
                                                },
                                              )),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            buttonSize: 46,
                                            icon: Icon(
                                              Icons.delete_outline_rounded,
                                              color: Color(0xFFE62424),
                                              size: 20,
                                            ),
                                            onPressed: () async {
                                              var updatedList =
                                                  List<ProductsRecord>.from(
                                                      widget.cartList.cast<
                                                          ProductsRecord>());
                                              updatedList
                                                  .removeAt(mainContainerIndex);
                                              setState(() {
                                                widget.cartList = updatedList;
                                                if (widget.cartList.contains(
                                                    mainContainerItemRecord)) {
                                                  mainContainerIndex =
                                                      widget.cartList.indexOf(
                                                          mainContainerItemRecord);
                                                }
                                              });
                                              widget.onDelete
                                                  .call(widget.cartList);
                                            },
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${mainContainerItemRecord.price} SAR",
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
