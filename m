Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web12.6804.1625145089145828574
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Jul 2021 06:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=vzMjC4vf;
 spf=permerror, err=parse error for token &{10 18 _spf4.garmin.com}: limit exceeded (domain: garmin.com, ip: 205.220.165.212, mailfrom: timothy.mertz@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 161D8oHf000400
	for <meta-arm@lists.yoctoproject.org>; Thu, 1 Jul 2021 08:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pps1; bh=Nal3OMQ8Apyrh2andgOYI0dIndlL4Zd8XWAGi4h/9rY=;
 b=vzMjC4vf0UZy6Qf46iSeSiKJOfvEMOV9ZJrHr7gDUpWTtL4HSJ6IEzjXvfhLPIwjki2O
 6j9KbDmnIXGcjJSh8vQq4JECt0JNe2tWjEEJBTsQDNuAqQjr8m+7gEaBUr8LGehAY5Zu
 QfLgE2f2e704ynllZY+wRAJc5ttmTxRCYuLpIMwjVTiYVDRfLVvVVLcBffGEQC7+3aHo
 pfcpX2Z9dSx0jSqQR77UqMJLb4R+3ddoTUwGk5XRkVloJPD4kMANv0xL4pyafGCr/bCK
 P9v+6CwdkEcoGmWz4i/LtgESHuBsphvFBASYp8SruVLEiNR7pZSKocvAGG37wGsL4le1 cA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-000eb902.pphosted.com with ESMTP id 39gfrk2wdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Thu, 01 Jul 2021 08:11:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEncqj0w5JzcyEt8bVeLy1RYAjXA/1+qnz1kG3zjgfymnQIWHb3eyo15/pBpPdFwftAEz6i12BvLFhBSPYpBYi4IOEkwaFCw0oKaxegeIdGTMzCOi72YXCRmVRhWDcvGbiET3A0U0zYTyeROT8IfOuf9afWnTRrc1VhxK+2ka0pXmJwQ8tp+ojFec9zsHg/hYAchb+36YHGmzX+XJtu07mcnGUe41HZ2ZAZTq0xacuCpa0HIgNZ+3eBAMU8xaXFNVMPN1/FVKw5DkTnC4fUnPF2hRIiCy7aXZOw6CTe6IbIqSWlEKeIlCQHZzd8m3qfikewPRGJ9j9Wgj9kCO7kKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nal3OMQ8Apyrh2andgOYI0dIndlL4Zd8XWAGi4h/9rY=;
 b=UPGOUEsu3sXeoSHYk+GtrtNbXnL5iE94Cwaig6IPy1v9vhWQP7VNmmbkoGR9K4vOni4/2Zt2zFIn0MJ8/cw6fNtQfCzYoz3LeWcCA28KiIfNfRaidw0PUKo31XOUsyT1ypfFbHsyPlauK9yZ5XaYn5mZa2sejQHD1JFEyWsloREvSdmCOx/O8QTLTq3s06iC8W0SFWzpAP4E8vnXjvNYCjMoA74HWbbMUaiIS7RrxecEkMZc0Xbk0tnfzyMkXr+Pka+ZpGI9chBIbyO54R3D2SsANxA9ISY0GWum75KTSecZ/3QWclJvpgPhH7EzVZmMVceW6P0zrczsV0DYYdhleA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nal3OMQ8Apyrh2andgOYI0dIndlL4Zd8XWAGi4h/9rY=;
 b=wkMhhq7ikCo2w34wy0zAfBPt5x/177GaInQmd7JXjYuwNrjhrwOCavr93jprHYS5xgAKLLakmcNWq9hYVuEwskcVfTtEDJ6U8nGMUmg/IBpC4dq5ZFtpJ3PGTJJxTOsJN578PfMfagFXNzTwqO4N5NG/+qXnf70qNyCPAIch2QXyJ4ywWM7x2lwjgwl9I7XaJoRSNEfNwRbosC/BSL/Y+gaIz+YupxwOWuEJPCkadJO6E9+/n2LFTOC+NLyJ4BFGflMZ5nBBuWgzezG6MA6OopXMDiR+EFN6rVabCf/QBFii+p85hxKwZMjNPGykfu0hlJ0x/QPa/fP5TzPn/52ofg==
Received: from DM6PR08CA0037.namprd08.prod.outlook.com (2603:10b6:5:1e0::11)
 by BYAPR04MB5382.namprd04.prod.outlook.com (2603:10b6:a03:c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.26; Thu, 1 Jul
 2021 13:11:26 +0000
Received: from DM6NAM10FT053.eop-nam10.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::b5) by DM6PR08CA0037.outlook.office365.com
 (2603:10b6:5:1e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Thu, 1 Jul 2021 13:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; lists.yoctoproject.org; dkim=none (message not
 signed) header.d=none;lists.yoctoproject.org; dmarc=pass action=none
 header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=olawpa-edge3.garmin.com;
Received: from olawpa-edge3.garmin.com (204.77.163.244) by
 DM6NAM10FT053.mail.protection.outlook.com (10.13.153.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 13:11:26 +0000
Received: from OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) by
 olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Thu, 1 Jul 2021 08:11:22 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.10; Thu, 1 Jul 2021 08:11:24 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2242.010; Thu, 1 Jul 2021 08:11:24 -0500
From: "Timothy Mertz" <timothy.mertz@garmin.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: "Watt, Joshua" <Joshua.Watt@garmin.com>
Subject: Re: [PATCH v2] external-arm-sdk-toolchain: Fix parsing error with INCOMPATIBLE_LICENSE
Thread-Topic: [PATCH v2] external-arm-sdk-toolchain: Fix parsing error with
 INCOMPATIBLE_LICENSE
Thread-Index: AQHXbSoKmhM0gvuPCECPDV8dn1XQ2KsuGkm7
Date: Thu, 1 Jul 2021 13:11:24 +0000
Message-ID: <1915494c28a848dda946842fad601d17@garmin.com>
References: <20210511150609.15943-1-Joshua.Watt@garmin.com>,<20210629210207.32008-1-timothy.mertz@garmin.com>
In-Reply-To: <20210629210207.32008-1-timothy.mertz@garmin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.5.209.13]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6621aa6-7354-4038-ad59-08d93c91bb62
X-MS-TrafficTypeDiagnostic: BYAPR04MB5382:
X-Microsoft-Antispam-PRVS: 
	<BYAPR04MB5382478CF4487ABF38CAF8348B009@BYAPR04MB5382.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1zVBfGLOxSQwCY0UK9L5WNmYpeJfCTgedoKNiQY7R0//504cKWS819Y0m773gbes0lpsE+u/HD0J27nPmNFX5vYknrkGrIgD9oo8NRshyE7dZlHaj/WhYR6DD9hb9SipPyZNRZf1BNzvor+drUBrXcPpo5/Ynqdey+FGMwAu5b1HpzwdeqyN+MMov5tky/pN0GGylfXoO/8ARjZ5Dmh7wDSa8Ga+sXxIUU/DcOtDB+dUB+AzZd6Q7cEudMrbhCS8dRzBXGS3tN90ktwvFZalsazGSlfdugS+GHe2CC4afUtRsfONzjl5xXclNZhk5fViF0Ex3FKXdrScf/sHTgSBWwF0V4RQuE0409xVP1mshMLFx85oAhJddgGOYX85l6Sfg8Nt4/ZjxNp2OzEgQiCpl3IYmZEwJrd+q/sCWa4J0EwVRCNql0GXwncf3Nh8Fk0kN+isbIKir2TVbRGvjormzU/1Um0RAAZyzP9IoKJpIbNeSY6rPHnOezYRMOxs2y4zc6uwRR8xabQ3EY/OrGdMgXWLb2ZLs2rd6SCkyehifUE39W9uTWpGPnlI5OwKSavdaFcHQL324sWEFpCk3LYVb7cRgbefx/UQ80Kkr9cPQQ5JZjm/40q+zjp++23P6I7SydicIySchziwCMWVJmBACbSCKVvBco1yqUbhGiddd/Nl4klYZcaholSt4Erxc5mLOp9h+KhJXJIGgO5DJx1EHg==
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:olawpa-edge3.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(39860400002)(396003)(376002)(136003)(346002)(46966006)(36840700001)(8936002)(4326008)(70586007)(24736004)(2616005)(8676002)(316002)(82740400003)(70206006)(426003)(7696005)(7636003)(356005)(107886003)(53546011)(186003)(26005)(108616005)(83380400001)(478600001)(2906002)(336012)(6916009)(86362001)(36756003)(36860700001)(5660300002)(82310400003)(47076005);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 13:11:26.0207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6621aa6-7354-4038-ad59-08d93c91bb62
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[olawpa-edge3.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM10FT053.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5382
X-Proofpoint-ORIG-GUID: 4-fgfqyB3AKW2q3kmyz_T7yUM2hOqe3E
X-Proofpoint-GUID: 4-fgfqyB3AKW2q3kmyz_T7yUM2hOqe3E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-01_07:2021-07-01,2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107010083
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_1915494c28a848dda946842fad601d17garmincom_"

--_000_1915494c28a848dda946842fad601d17garmincom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Would it be possible to have this patch backported to dunfell as well?


Thanks!

________________________________
From: Timothy Mertz <timothy.mertz@garmin.com>
Sent: Tuesday, June 29, 2021 4:02:07 PM
To: meta-arm@lists.yoctoproject.org
Cc: Mertz, Timothy; Watt, Joshua
Subject: [PATCH v2] external-arm-sdk-toolchain: Fix parsing error with INCO=
MPATIBLE_LICENSE

This change fixes parsing error that occurs when INCOMPATIBLE_LICENSE =3D
"GPLv3" by defining EAT_BFD_LICENSE, EAT_GDB_LICENSE and EAT_RLE_LICENSE
in license.inc and requiring it in external-arm-sdk-toolchain.bb

Definitions in external-arm-toolchain-versions.inc are made redundant so
they are removed.

Signed-off-by: Timothy Mertz <timothy.mertz@garmin.com>
Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
---
 .../include/external-arm-toolchain-versions.inc    | 14 --------------
 .../external-arm-sdk-toolchain.bb                  |  5 ++---
 .../external-arm-toolchain/license.inc             |  3 +++
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-=
versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchai=
n-versions.inc
index 9d4f967..a89f2f0 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-version=
s.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-version=
s.inc
@@ -139,19 +139,5 @@ python external_arm_toolchain_version_handler () {
     d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
     d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
     d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
-
-    lc_libc =3D "LGPL-2.1"
-    lc_gcc =3D "GPL-3.0"
-    lc_rle =3D "GPL-3.0-with-GCC-exception"
-    lc_gdb =3D "GPL-3.0"
-    lc_bfd =3D "GPL-3.0"
-
-    d.setVar('EAT_LIBC_LICENSE', lc_libc)
-    d.setVar('EAT_GCC_LICENSE', lc_gcc)
-    d.setVar('EAT_RLE_LICENSE', lc_rle)
-    d.setVar('EAT_GDB_LICENSE', lc_gdb)
-    d.setVar('EAT_BFD_LICENSE', lc_bfd)
-
-    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc, l=
c_rle, lc_gdb, lc_bfd))
 }
 addhandler external_arm_toolchain_version_handler
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ext=
ernal-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-sdk-toolchain.bb
index 3f12b4d..4f0adce 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-a=
rm-sdk-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-a=
rm-sdk-toolchain.bb
@@ -1,5 +1,7 @@
 inherit cross-canadian

+require license.inc
+
 PN =3D "external-arm-sdk-toolchain-${TARGET_ARCH}"
 BPN =3D "external-arm-sdk-toolchain"
 PV =3D "${EAT_VER_MAIN}"
@@ -10,9 +12,6 @@ INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_DEFAULT_DEPS =3D "1"
 EXCLUDE_FROM_SHLIBS =3D "1"

-EAT_LICENSE ??=3D ""
-
-LICENSE =3D "${EAT_LICENSE}"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"

 # Skip packaging QA checks for prebuilt binaries
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/lic=
ense.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/licen=
se.inc
index b6ee42c..fcc9268 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.in=
c
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.in=
c
@@ -1,7 +1,10 @@
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv2.=
1 & LGPLv2"

+EAT_BFD_LICENSE =3D "GPL-3.0"
 EAT_GCC_LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
+EAT_GDB_LICENSE =3D "GPL-3.0"
 EAT_LIBC_LICENSE =3D "GPLv2 & LGPLv2.1"
+EAT_RLE_LICENSE =3D "GPL-3.0-with-GCC-exception"

 LICENSE_${PN} =3D "${EAT_LIBC_LICENSE}"
 LICENSE_${PN}-dev =3D "${EAT_LIBC_LICENSE}"
--
2.17.1


--_000_1915494c28a848dda946842fad601d17garmincom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Would it be possible to have this patch backported to dunfell as well?</=
p>
<p><br>
</p>
<p>Thanks!</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Timothy Mertz &lt;t=
imothy.mertz@garmin.com&gt;<br>
<b>Sent:</b> Tuesday, June 29, 2021 4:02:07 PM<br>
<b>To:</b> meta-arm@lists.yoctoproject.org<br>
<b>Cc:</b> Mertz, Timothy; Watt, Joshua<br>
<b>Subject:</b> [PATCH v2] external-arm-sdk-toolchain: Fix parsing error wi=
th INCOMPATIBLE_LICENSE</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">This change fixes parsing error that occurs when I=
NCOMPATIBLE_LICENSE =3D<br>
&quot;GPLv3&quot; by defining EAT_BFD_LICENSE, EAT_GDB_LICENSE and EAT_RLE_=
LICENSE<br>
in license.inc and requiring it in external-arm-sdk-toolchain.bb<br>
<br>
Definitions in external-arm-toolchain-versions.inc are made redundant so<br=
>
they are removed.<br>
<br>
Signed-off-by: Timothy Mertz &lt;timothy.mertz@garmin.com&gt;<br>
Signed-off-by: Joshua Watt &lt;Joshua.Watt@garmin.com&gt;<br>
---<br>
&nbsp;.../include/external-arm-toolchain-versions.inc&nbsp;&nbsp;&nbsp; | 1=
4 --------------<br>
&nbsp;.../external-arm-sdk-toolchain.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
5 &#43;&#43;---<br>
&nbsp;.../external-arm-toolchain/license.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;&#43;<br>
&nbsp;3 files changed, 5 insertions(&#43;), 17 deletions(-)<br>
<br>
diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-=
versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchai=
n-versions.inc<br>
index 9d4f967..a89f2f0 100644<br>
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-version=
s.inc<br>
&#43;&#43;&#43; b/meta-arm-toolchain/conf/distro/include/external-arm-toolc=
hain-versions.inc<br>
@@ -139,19 &#43;139,5 @@ python external_arm_toolchain_version_handler () {=
<br>
&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(=
ld))<br>
&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))<b=
r>
-<br>
-&nbsp;&nbsp;&nbsp; lc_libc =3D &quot;LGPL-2.1&quot;<br>
-&nbsp;&nbsp;&nbsp; lc_gcc =3D &quot;GPL-3.0&quot;<br>
-&nbsp;&nbsp;&nbsp; lc_rle =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
-&nbsp;&nbsp;&nbsp; lc_gdb =3D &quot;GPL-3.0&quot;<br>
-&nbsp;&nbsp;&nbsp; lc_bfd =3D &quot;GPL-3.0&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp; d.setVar('EAT_LIBC_LICENSE', lc_libc)<br>
-&nbsp;&nbsp;&nbsp; d.setVar('EAT_GCC_LICENSE', lc_gcc)<br>
-&nbsp;&nbsp;&nbsp; d.setVar('EAT_RLE_LICENSE', lc_rle)<br>
-&nbsp;&nbsp;&nbsp; d.setVar('EAT_GDB_LICENSE', lc_gdb)<br>
-&nbsp;&nbsp;&nbsp; d.setVar('EAT_BFD_LICENSE', lc_bfd)<br>
-<br>
-&nbsp;&nbsp;&nbsp; d.setVar('EAT_LICENSE', &quot;%s &amp; %s &amp; %s &amp=
; %s &amp; %s&quot; % (lc_libc, lc_gcc, lc_rle, lc_gdb, lc_bfd))<br>
&nbsp;}<br>
&nbsp;addhandler external_arm_toolchain_version_handler<br>
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ext=
ernal-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-sdk-toolchain.bb<br>
index 3f12b4d..4f0adce 100644<br>
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-a=
rm-sdk-toolchain.bb<br>
&#43;&#43;&#43; b/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/external-arm-sdk-toolchain.bb<br>
@@ -1,5 &#43;1,7 @@<br>
&nbsp;inherit cross-canadian<br>
&nbsp;<br>
&#43;require license.inc<br>
&#43;<br>
&nbsp;PN =3D &quot;external-arm-sdk-toolchain-${TARGET_ARCH}&quot;<br>
&nbsp;BPN =3D &quot;external-arm-sdk-toolchain&quot;<br>
&nbsp;PV =3D &quot;${EAT_VER_MAIN}&quot;<br>
@@ -10,9 &#43;12,6 @@ INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&nbsp;INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&nbsp;EXCLUDE_FROM_SHLIBS =3D &quot;1&quot;<br>
&nbsp;<br>
-EAT_LICENSE ??=3D &quot;&quot;<br>
-<br>
-LICENSE =3D &quot;${EAT_LICENSE}&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://${COMMON_LICENSE_DIR}/MI=
T;md5=3D0835ade698e0bcf8506ecda2f7b4f302">file://${COMMON_LICENSE_DIR}/MIT;=
md5=3D0835ade698e0bcf8506ecda2f7b4f302</a>&quot;<br>
&nbsp;<br>
&nbsp;# Skip packaging QA checks for prebuilt binaries<br>
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/lic=
ense.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/licen=
se.inc<br>
index b6ee42c..fcc9268 100644<br>
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.in=
c<br>
&#43;&#43;&#43; b/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/license.inc<br>
@@ -1,7 &#43;1,10 @@<br>
&nbsp;LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3 &amp; GPLv2 =
&amp; LGPLv3 &amp; LGPLv2.1 &amp; LGPLv2&quot;<br>
&nbsp;<br>
&#43;EAT_BFD_LICENSE =3D &quot;GPL-3.0&quot;<br>
&nbsp;EAT_GCC_LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot=
;<br>
&#43;EAT_GDB_LICENSE =3D &quot;GPL-3.0&quot;<br>
&nbsp;EAT_LIBC_LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
&#43;EAT_RLE_LICENSE =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
&nbsp;<br>
&nbsp;LICENSE_${PN} =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&nbsp;LICENSE_${PN}-dev =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_1915494c28a848dda946842fad601d17garmincom_--
