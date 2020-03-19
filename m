Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.58])
 by mx.groups.io with SMTP id smtpd.web10.7571.1584604954261601496
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 01:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=CXDwwY6W;
 spf=pass (domain: arm.com, ip: 40.107.6.58, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MpTisJUoESsB26lmbuhTREIR8Lob86jpQMDkO3aR60=;
 b=CXDwwY6WYznmasT7cmx2YI46HzyC3uMM0PVU6AIgwNxu0c74iSi8O8BzE2Gx1S3RZgEtZpCVt5qJbQ+RWrndhNccErNjoWiSZ/XdICX6wqUhD5xwIQURVjS4xq9ZH/YCg4gkTtjVLtpEXRU5rMNXf24eg4b+xM53zUe7Lf6xRPQ=
Received: from AM6P195CA0101.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::42)
 by AM0PR08MB5394.eurprd08.prod.outlook.com (2603:10a6:208:183::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Thu, 19 Mar
 2020 08:02:32 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::a0) by AM6P195CA0101.outlook.office365.com
 (2603:10a6:209:86::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend
 Transport; Thu, 19 Mar 2020 08:02:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Thu, 19 Mar 2020 08:02:31 +0000
Received: ("Tessian outbound 88ba19940385:v48"); Thu, 19 Mar 2020 08:02:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bcd7d8b8f0179e30
X-CR-MTA-TID: 64aa7808
Received: from fc9b2d739eb8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1AD48535-E9E0-47A7-ADDD-10CC929CFBD3.1;
	Thu, 19 Mar 2020 08:02:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc9b2d739eb8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Mar 2020 08:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ejkirl9FbkIRghpbnwmlvKEVlDxKalXnizLOYik5moLbNA4vg7e3PN+scGzT/Kj9/AmXZ7eSD7LWwqr+1su0UbWXvMXSr6lgxbf6xNnSoceclCbEIiKtglTeHAXgKPHbgeYtem/xg+jPwkl8jIjB1VidlxKaERVCcum5vWEEOj3/URoOrfP9QVq1XZzXwM6/mEtsXP90YX5Uu1Urh4iuwTSNI6CWAx1thbQ7lanQMkdUok7mQTO/ybcDkQ7sg6ecm7Q1+e0YrWPOBt35v7NPiJfCjcVpeFc4PtqEDTIK5YU0edseiM/o+9rqV7R+Ceroz1JUx9knywUfjgc4BhGWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MpTisJUoESsB26lmbuhTREIR8Lob86jpQMDkO3aR60=;
 b=lRBPbshMRF0tiA7wNKH9iarRnFazJOZq4YfZJQFh1OJrzJwpk7MN7RDd6FTJ9snl941wbvw9gq/9dTQ0HGH/4/3d2uIQiKLGgO28wIVMIeQzmaRcjtRiZT8jlr8qklIiSvP5C9xJW/zMF47dOTYdTkY0iblIcGMKEQTSnKhD5j2TOo7AwhifnKeng7Bf0RHSehMbYSTmy+ndQeEZXo7OuXvN5WAF9/tJA86OYd4tIA5BuD48/QyPb21do0rpnsTbTTzX43u0iXsTYwp7w/gas1+XTQGPPHB2y0sm8jfh0CgywjGBBiLP4GLfoJzQJ+sPqo/TyAyCtkxb6qoSex0lBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MpTisJUoESsB26lmbuhTREIR8Lob86jpQMDkO3aR60=;
 b=CXDwwY6WYznmasT7cmx2YI46HzyC3uMM0PVU6AIgwNxu0c74iSi8O8BzE2Gx1S3RZgEtZpCVt5qJbQ+RWrndhNccErNjoWiSZ/XdICX6wqUhD5xwIQURVjS4xq9ZH/YCg4gkTtjVLtpEXRU5rMNXf24eg4b+xM53zUe7Lf6xRPQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3274.eurprd08.prod.outlook.com (52.134.111.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18; Thu, 19 Mar 2020 08:02:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 08:02:24 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] Use xen dtb if xen image is present
Thread-Topic: [meta-arm] [PATCH] Use xen dtb if xen image is present
Thread-Index: AQHV/RtnpS4j5n85JEuXsJGRVMbmcahPjzqA
Date: Thu, 19 Mar 2020 08:02:24 +0000
Message-ID: <E0E058E4-2B09-4DC2-ACD4-995919CC1970@arm.com>
References: <20200318114934.9841-1-rahul.singh@arm.com>
In-Reply-To: <20200318114934.9841-1-rahul.singh@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da24bb64-e305-4211-b0b5-08d7cbdbe023
x-ms-traffictypediagnostic: DB7PR08MB3274:|AM0PR08MB5394:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5394F07936586A7D020B64A09DF40@AM0PR08MB5394.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:431;OLM:431;
x-forefront-prvs: 0347410860
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(199004)(6512007)(316002)(8936002)(86362001)(6506007)(6486002)(33656002)(53546011)(81166006)(81156014)(478600001)(8676002)(4326008)(66946007)(71200400001)(66446008)(186003)(66556008)(64756008)(36756003)(76116006)(66476007)(91956017)(2906002)(26005)(6916009)(2616005)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3274;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 STnURmtENUcfG/VhVYf1Iz1IY0zFLq2ssn22Fq+rltVhfqAwLaj3USQl++lciO6nc0wdoMFgKkZ7yTEO6GO8JwMfKPA9DtUsUFQzxXgomBDQQ44XhklOiXSELOfJlcWUfDMpkJjM1quROIEfnDcWlbCzJxxpWnW2e6LEIrAvjqoZdX3dQD5dd/1TWmJ3XYiFiqZFivBFWynQjI1cmRpOnfoonhJkQ0mTmCCqxj3Xyacos9CzcwKuf2WuEM0iWoSWlE6KKbslogCyPgW9E6MuEIm1ofo11wUMLh1yiuEXY6lklYsc0qWmBwR/hSysHKdGaEKRQgA41vu5mTckFWK22okVXbml6nGXW4sBiZrPp+/cq6cAT87evg6U82WSR1Nipchp+69RHHrbcg2M/eToK5bkRQwGcZdfFknqAdFAsfw0UEkIFdLN8T77g5F2S8fcvj9/igvZ8IT0iB2UgWmgGgGqJ5ipBBJbUi31iO3+kvGW/4D2ZQvgEBHZP99iKghd6JABMRJFVKoV8lkLatGoSg==
x-ms-exchange-antispam-messagedata: 
 VA0RkEC8NNfnWC8SO6hiZ0+zJL3Ay8JlPMcahGOSkklJFCzbl81CJnA5y0QWOH26DMfCL9KHu1QaiQMU1DkInAtBHW1gJ5PvuEz1VZV0zZxyLKHcAVGIrcfgMfgEQG5cB8tvrJtH+bUdzIZNN5fkIA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3274
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(199004)(46966005)(6506007)(6916009)(53546011)(6486002)(33656002)(70586007)(36906005)(81156014)(8936002)(86362001)(81166006)(6512007)(70206006)(8676002)(316002)(4326008)(2906002)(36756003)(336012)(26005)(47076004)(2616005)(186003)(356004)(478600001)(45080400002)(5660300002)(26826003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB5394;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	60645d9b-b045-45ac-1252-08d7cbdbdbe2
X-Forefront-PRVS: 0347410860
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nmlYVTNok3I58P1IP6aXS1s32AogvrXeH901LBduCsqzgDh6tAOduR0j7zMwd1rUvdDmHAIoqNshMshKD9mTznrOjchLsmSV5LJVnO6xboJreNUafqgbCIx7Zll7FIpQEtHMNpCehArMxsA4o1EtSA6QArWtVbIbQZmaPwlg3I/8EnGqyvvcH7gHWGtCZ+p4kzrHU5inRW65fd0/WjnKSSgjFIhvc7iyRW5t/X64O92Z+/b/ZbDqRxTyw1ofpeuiBoijRnMia3qxmYVwkvj9tawPAbXZZKZB+ussW/+ehj27y4/w5frqy2w6OR5ZrtUyNC5YtubLHaCEijQ5cb7K7zXEk4Bs0VNHkzJ0QAXECaClz1tQwpzIgT0ExUFAMMa9Ekw/zHnHQpND9DlFbUWyYByB7BccYeolGRK2sKOIqNwrPXdgFHwxckJF4/+rI/0DUFaGD+MnaQh8HlMExAHcVTJGN8vtLZN1F9iY3Hm6VFbYTppRT/zObriPlP3jh+9r0TGZXsBHb3GKzagDP8qqhpP7lGyjZ6mXmnSNym9MV4g8rlKWDyhcVVYFyWco0S9IiH0ot61ySUCPfGpDgCRXcQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 08:02:31.4105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da24bb64-e305-4211-b0b5-08d7cbdbe023
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5394
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_E0E058E42B094DC2ACD4995919CC1970armcom_"

--_000_E0E058E42B094DC2ACD4995919CC1970armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 18 Mar 2020, at 11:49, Rahul Singh via Lists.Yoctoproject.Org<http://Lis=
ts.Yoctoproject.Org> <rahul.singh=3Darm.com@lists.yoctoproject.org<mailto:r=
ahul.singh=3Darm.com@lists.yoctoproject.org>> wrote:

Use xen dtb if xen image is present for foundation
and fvp pltaform.

Change-Id: I8ee0c5f59ea731202ca97c2cdef315cc5e6665e6
Signed-off-by: Rahul Singh <rahul.singh@arm.com<mailto:rahul.singh@arm.com>=
>
---
.../fvp-common/files/start-foundation-armv8.sh | 18 +++++++++++-------
.../fvp-common/files/start-fvp-base.sh         | 18 +++++++++++-------
2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh
index 1df4fd8..a113998 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8=
.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8=
.sh
@@ -12,7 +12,7 @@ source <(MACHINE=3Dfoundation-armv8 bitbake -e foundation=
-armv8-native | grep \

# Bitbake image to run
IMAGE_NAME=3D"$(cd $DEPLOY_DIR_IMAGE; ls *-foundation-armv8.manifest | \
-    sed -e "s/-foundation-armv8\.manifest//")"
+    sed -e "s/-foundation-armv8\.manifest//" | head -1)"

# BL1 and FIP files
BL1_FILE=3D"bl1-fvp.bin"
@@ -210,6 +210,16 @@ if [ -n "$KERNEL_FILE" ]; then
        --data=3D$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
fi

+# Add xen if present
+if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
+   FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
+       --data=3D$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
+   #switch dtb if there
+   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
+      DTB_FILE=3D$(basename ${DTB_FILE} .dtb)-xen.dtb
+   fi
+fi
+
# Add DTB
if [ -n "$DTB_FILE" ]; then
    if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
@@ -220,12 +230,6 @@ if [ -n "$DTB_FILE" ]; then
        --data=3D$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
fi

-# Add xen if present
-if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
-   FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
-       --data=3D$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
-fi
-
# Add disk if present
if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
    FOUNDATION_PLAT_ARGS=3D"$FOUNDATION_PLAT_ARGS \
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.=
sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
index ab60cea..f391c23 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
@@ -12,7 +12,7 @@ source <(MACHINE=3Dfvp-base bitbake -e fvp-base-native | =
grep \

# Bitbake image to run
IMAGE_NAME=3D"$(cd $DEPLOY_DIR_IMAGE; ls *-fvp-base.manifest | \
-    sed -e "s/-fvp-base\.manifest//")"
+    sed -e "s/-fvp-base\.manifest//" | head -1)"

# BL1 and FIP files
BL1_FILE=3D"bl1-fvp.bin"
@@ -202,6 +202,16 @@ if [ -n "$KERNEL_FILE" ]; then
        --data cluster0.cpu0=3D$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
fi

+# Add xen if present
+if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
+    FVPARGS=3D"$FVPARGS \
+        --data cluster0.cpu0=3D$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
+   #switch dtb if there
+   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
+      DTB_FILE=3D$(basename ${DTB_FILE} .dtb)-xen.dtb
+   fi
+fi
+
# Add DTB
if [ -n "$DTB_FILE" ]; then
    if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
@@ -212,12 +222,6 @@ if [ -n "$DTB_FILE" ]; then
        --data cluster0.cpu0=3D$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
fi

-# Add xen if present
-if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
-    FVPARGS=3D"$FVPARGS \
-        --data cluster0.cpu0=3D$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
-fi
-
# Add disk if present
if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
    FVPARGS=3D"$FVPARGS \
--
2.17.1


Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>


--_000_E0E058E42B094DC2ACD4995919CC1970armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <F46EF935FB7E5245827D6DCE8605FD1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 18 Mar 2020, at 11:49, Rahul Singh via <a href=3D"http:/=
/Lists.Yoctoproject.Org" class=3D"">
Lists.Yoctoproject.Org</a> &lt;<a href=3D"mailto:rahul.singh=3Darm.com@list=
s.yoctoproject.org" class=3D"">rahul.singh=3Darm.com@lists.yoctoproject.org=
</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Use xen dtb if xen image is present for foundation<br class=
=3D"">
and fvp pltaform.<br class=3D"">
<br class=3D"">
Change-Id: I8ee0c5f59ea731202ca97c2cdef315cc5e6665e6<br class=3D"">
Signed-off-by: Rahul Singh &lt;<a href=3D"mailto:rahul.singh@arm.com" class=
=3D"">rahul.singh@arm.com</a>&gt;<br class=3D"">
---<br class=3D"">
.../fvp-common/files/start-foundation-armv8.sh | 18 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;-------<br class=3D"">
.../fvp-common/files/start-fvp-base.sh &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;| 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---=
----<br class=3D"">
2 files changed, 22 insertions(&#43;), 14 deletions(-)<br class=3D"">
<br class=3D"">
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundatio=
n-armv8.sh<br class=3D"">
index 1df4fd8..a113998 100755<br class=3D"">
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8=
.sh<br class=3D"">
&#43;&#43;&#43; b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foun=
dation-armv8.sh<br class=3D"">
@@ -12,7 &#43;12,7 @@ source &lt;(MACHINE=3Dfoundation-armv8 bitbake -e fou=
ndation-armv8-native | grep \<br class=3D"">
<br class=3D"">
# Bitbake image to run<br class=3D"">
IMAGE_NAME=3D&quot;$(cd $DEPLOY_DIR_IMAGE; ls *-foundation-armv8.manifest |=
 \<br class=3D"">
- &nbsp;&nbsp;&nbsp;sed -e &quot;s/-foundation-armv8\.manifest//&quot;)&quo=
t;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;sed -e &quot;s/-foundation-armv8\.manifest//&quot; =
| head -1)&quot;<br class=3D"">
<br class=3D"">
# BL1 and FIP files<br class=3D"">
BL1_FILE=3D&quot;bl1-fvp.bin&quot;<br class=3D"">
@@ -210,6 &#43;210,16 @@ if [ -n &quot;$KERNEL_FILE&quot; ]; then<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--data=3D$DEPLOY_DIR_IMAGE/=
$KERNEL_FILE@$KERNEL_ADDR&quot;<br class=3D"">
fi<br class=3D"">
<br class=3D"">
&#43;# Add xen if present<br class=3D"">
&#43;if [ -n &quot;$XEN_FILE&quot; -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; the=
n<br class=3D"">
&#43; &nbsp;&nbsp;FOUNDATION_PLAT_ARGS=3D&quot;$FOUNDATION_PLAT_ARGS \<br c=
lass=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--data=3D$DEPLOY_DIR_IMAGE/$XEN_F=
ILE@$XEN_ADDR&quot;<br class=3D"">
&#43; &nbsp;&nbsp;#switch dtb if there<br class=3D"">
&#43; &nbsp;&nbsp;if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xe=
n.dtb ]; then<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DTB_FILE=3D$(basename ${DTB_FILE} .dtb)=
-xen.dtb<br class=3D"">
&#43; &nbsp;&nbsp;fi<br class=3D"">
&#43;fi<br class=3D"">
&#43;<br class=3D"">
# Add DTB<br class=3D"">
if [ -n &quot;$DTB_FILE&quot; ]; then<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then<br cl=
ass=3D"">
@@ -220,12 &#43;230,6 @@ if [ -n &quot;$DTB_FILE&quot; ]; then<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--data=3D$DEPLOY_DIR_IMAGE/=
$DTB_FILE@$DTB_ADDR&quot;<br class=3D"">
fi<br class=3D"">
<br class=3D"">
-# Add xen if present<br class=3D"">
-if [ -n &quot;$XEN_FILE&quot; -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then<br=
 class=3D"">
- &nbsp;&nbsp;FOUNDATION_PLAT_ARGS=3D&quot;$FOUNDATION_PLAT_ARGS \<br class=
=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--data=3D$DEPLOY_DIR_IMAGE/$XEN_FILE@=
$XEN_ADDR&quot;<br class=3D"">
-fi<br class=3D"">
-<br class=3D"">
# Add disk if present<br class=3D"">
if [ -n &quot;$DISK_FILE&quot; -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then<b=
r class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;FOUNDATION_PLAT_ARGS=3D&quot;$FOUNDATION_PLAT_ARGS =
\<br class=3D"">
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.=
sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh<br cl=
ass=3D"">
index ab60cea..f391c23 100755<br class=3D"">
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh<br c=
lass=3D"">
&#43;&#43;&#43; b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-=
base.sh<br class=3D"">
@@ -12,7 &#43;12,7 @@ source &lt;(MACHINE=3Dfvp-base bitbake -e fvp-base-na=
tive | grep \<br class=3D"">
<br class=3D"">
# Bitbake image to run<br class=3D"">
IMAGE_NAME=3D&quot;$(cd $DEPLOY_DIR_IMAGE; ls *-fvp-base.manifest | \<br cl=
ass=3D"">
- &nbsp;&nbsp;&nbsp;sed -e &quot;s/-fvp-base\.manifest//&quot;)&quot;<br cl=
ass=3D"">
&#43; &nbsp;&nbsp;&nbsp;sed -e &quot;s/-fvp-base\.manifest//&quot; | head -=
1)&quot;<br class=3D"">
<br class=3D"">
# BL1 and FIP files<br class=3D"">
BL1_FILE=3D&quot;bl1-fvp.bin&quot;<br class=3D"">
@@ -202,6 &#43;202,16 @@ if [ -n &quot;$KERNEL_FILE&quot; ]; then<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--data cluster0.cpu0=3D$DEP=
LOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR&quot;<br class=3D"">
fi<br class=3D"">
<br class=3D"">
&#43;# Add xen if present<br class=3D"">
&#43;if [ -n &quot;$XEN_FILE&quot; -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; the=
n<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;FVPARGS=3D&quot;$FVPARGS \<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--data cluster0.cpu0=3D$DEP=
LOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR&quot;<br class=3D"">
&#43; &nbsp;&nbsp;#switch dtb if there<br class=3D"">
&#43; &nbsp;&nbsp;if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xe=
n.dtb ]; then<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DTB_FILE=3D$(basename ${DTB_FILE} .dtb)=
-xen.dtb<br class=3D"">
&#43; &nbsp;&nbsp;fi<br class=3D"">
&#43;fi<br class=3D"">
&#43;<br class=3D"">
# Add DTB<br class=3D"">
if [ -n &quot;$DTB_FILE&quot; ]; then<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then<br cl=
ass=3D"">
@@ -212,12 &#43;222,6 @@ if [ -n &quot;$DTB_FILE&quot; ]; then<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--data cluster0.cpu0=3D$DEP=
LOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR&quot;<br class=3D"">
fi<br class=3D"">
<br class=3D"">
-# Add xen if present<br class=3D"">
-if [ -n &quot;$XEN_FILE&quot; -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then<br=
 class=3D"">
- &nbsp;&nbsp;&nbsp;FVPARGS=3D&quot;$FVPARGS \<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--data cluster0.cpu0=3D$DEPLOY_=
DIR_IMAGE/$XEN_FILE@$XEN_ADDR&quot;<br class=3D"">
-fi<br class=3D"">
-<br class=3D"">
# Add disk if present<br class=3D"">
if [ -n &quot;$DISK_FILE&quot; -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then<b=
r class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;FVPARGS=3D&quot;$FVPARGS \<br class=3D"">
-- <br class=3D"">
2.17.1<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@a=
rm.com" class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
</div>
<br class=3D"">
</body>
</html>

--_000_E0E058E42B094DC2ACD4995919CC1970armcom_--
