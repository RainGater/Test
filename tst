name: Build MX4300 NSS

on: workflow_dispatch

jobs:
    build:
        name: Build MX4300 NSS firmware images
        runs-on: ubuntu-latest
        permissions:
            contents: write
        steps:          
            - name: Get SHORT SHA ${SHORT_SHA}
              run: echo "SHORT_SHA=`echo ${GITHUB_SHA} | cut -c1-8`" >> $GITHUB_ENV

            - name: Set date
              run: echo "NOW=$(date +'%Y.%m.%d')" >> $GITHUB_ENV
    
            - name: Release
              uses: ncipollo/release-action@v1
              with:
                tag: mx4300-nss-"${{ env.NOW }}"
                
