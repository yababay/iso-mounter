#!/bin/bash

cd /media/video/iso

ls -1 *.iso | while read FN
do
    ID="`echo $FN | sed 's/.iso//'`"
    case "$ID" in 
        "271ced66-f586-11ea-8056-437f060d9dc5" | \
        "324d3b3a-f588-11ea-ae14-437570647347" | \
        "3cb0b726-f58a-11ea-bc1b-9fc3b26a7afc" | \
        "43f7c66c-f58c-11ea-bfc1-9fb25d28a204" | \
        "8450c43e-f587-11ea-929e-ff413f5f6ffd" | \
        "8d292f3c-f58d-11ea-91fd-535123d5a5fa" | \
        "90d633d6-f589-11ea-b483-a7aad35fda38" | \
        "96e1bd6c-f585-11ea-ba3e-7b1b096dc7a3" | \
        "9a3af9be-f58b-11ea-8a13-bfc64e11097e" | \
        "9e12591e-d386-11ea-9e47-8322be0b30a7" | \
        "a967c924-d387-11ea-a85b-b3c1de02066b" | \
        "bbb200e4-d388-11ea-a8af-0f5b9cfa642b" | \
        "d69fb1ba-f586-11ea-b7ce-6b9df6766ef8" | \
        "de92718a-f588-11ea-ac79-07f99b2fd8b9" | \
        "eafdb4e4-f58c-11ea-bbcb-472f52ef4048" | \
        "ffcbf150-165b-11ed-b940-37d18ba3b7f1" | \
        "321e719c-35cd-11ed-9697-732be1d16db3" | \
        "195ba5ea-05f2-11ed-9c18-3f9604663b08" | \
        "3d59e00c-0d26-11ed-96df-cbb9af7345fe" | \
        "217f52aa-e412-11ec-85ea-fb41bcb7b6b1" | \
        "8f823052-e416-11ec-b761-1b19d3a79438" | \
        "5ce86ffe-e730-11ec-87a2-23203cc6ca3e" | \
        "9a6ebcd4-e73a-11ec-ad60-7faf10f03f4e" | \
        "8ded2cba-fd57-11ec-a4d1-ef091dc7d6fa" | \
        "af1b4a2c-f576-11ec-8904-df2dbb0a95af" | \
        "f08d1310-e742-11ec-97ea-7f099b54dc04" | \
        "429b0c1c-f0c5-11ec-9799-d74f1babddf1" | \
        "86e3eed6-ebe1-11ec-9745-cf72766fcb33" | \
        "d6b76b5c-f22d-11ec-8a54-3f92373fea0a" | \
        "af1b4a2c-f576-11ec-8904-df2dbb0a95af" | \
        "b949667c-f70c-11ec-bd0f-073ba28b2e1b" | \
        "33d6c8a2-fafb-11ec-97da-f300f21117ea" | \
        "8ded2cba-fd57-11ec-a4d1-ef091dc7d6fa" | \
        "bc32fe9e-0075-11ed-a14d-f740d515a947" | \
        "01d48fae-135d-11ed-a8d2-07714755a0ab" | \
        "08d5e0f8-2313-11ed-b7c4-df4d8ab83e94" | \
        "11e2f7aa-26fe-11ed-bda2-172e8050a25c" | \
        "321e719c-35cd-11ed-9697-732be1d16db3" | \
        "6949a64d-47ad-4d22-a3c5-284143fdac22" | \
        "02a22cfa-6b86-11eb-a926-afdd062254b8" | \
        "86d9245c-7265-11eb-9264-5b331abbcee2" | \
        "99092202-726b-11eb-9c65-4fa136c1c747" | \
        "a0005fe0-6bb2-11eb-92b8-fbcb7f0cdff6" | \
        "033839ff-4f9c-4840-8909-052683b3e939" | \
        "0989ceb2-6b7f-11eb-b713-e74ca50a2e89" | \
        "13dc7a29-9073-4315-b8da-4da5027b8038" | \
        "1622f7f6-6ba8-11eb-9dae-2bf9c5140338" | \
        "1f76dbcc-6ba5-11eb-aee1-5b37d4060c8c" | \
        "1ff43e4b-9744-4d12-a97a-f569962c09b9" | \
        "26766d56-6ba6-11eb-accc-ffcb7777ad5d" | \
        "357d4410-26c9-460e-9e48-a02d9c0d2282" | \
        "65bf864f-9edd-438b-be02-f63d63c6d23d" | \
        "d8f1d2a4-6bb5-11eb-8ba6-c3bd851afc43" | \
        "c36b9858-6bbe-11eb-a599-df0590ab7ced" | \
        "c62e51c2-2706-47d7-8528-bf9988f79ea1" | \
        "62cec622-6b88-11eb-97e4-1f1e4fbe3d7d" | \
        "63a5bcba-6bb3-11eb-bb2f-5720034e7f83" | \
        "5848ef5c-7281-11eb-a716-478074537c0a" | \
        "814da63e-7260-11eb-a569-e34b3018e438" | \
        "ec372e32-f58a-11ea-9e16-5f9ae1d2c245")
            continue
            ;;
        *)
            echo image:
            echo "  id: $ID"
            echo "  label: `isoinfo -d -i $ISO | grep 'Volume id' | sed 's/Volume\ id\:\ //'`"
            echo "  content: $ID"
    esac
done
