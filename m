Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.79])
 by mx.groups.io with SMTP id smtpd.web10.559.1632238257920034825
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Sep 2021 08:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GZEYQ/9T;
 spf=pass (domain: arm.com, ip: 40.107.7.79, mailfrom: hugo.lhostis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNK6VbwCW9Qh4npgrIATfI0pttjgsHoeeZeoUynyMxw=;
 b=GZEYQ/9TLeX7j4kBmDxYQytOzuge1XFu1GpxJA41RLIg01mtnfpBtnrZ4Wmtq6u9v3lw6/8QhwuTjcFvJFyWoCyrupMkGYEdOcXvH12tLo9qC3lW+JyoHmhDIkc1LxiZBwuO2lJsXruXW0vEvbsg8VsSbcpQjcd6I9Kca4eMASI=
Received: from AM0PR02CA0140.eurprd02.prod.outlook.com (2603:10a6:20b:28d::7)
 by DB7PR08MB2970.eurprd08.prod.outlook.com (2603:10a6:5:17::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Tue, 21 Sep
 2021 15:30:54 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28d:cafe::4d) by AM0PR02CA0140.outlook.office365.com
 (2603:10a6:20b:28d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 15:30:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 15:30:52 +0000
Received: ("Tessian outbound 010023020eef:v103"); Tue, 21 Sep 2021 15:30:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d3bdd3c0df312129
X-CR-MTA-TID: 64aa7808
Received: from e1b6751be735.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AF44A8E2-6801-4BFB-BAB6-89005AECFAD9.1;
	Tue, 21 Sep 2021 15:30:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1b6751be735.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Sep 2021 15:30:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhNKbbHJuwLLCp5NVQftFWa0tMBZRpbd0nPiTd9Y5ZZqnwEAoaSgcN9p/tbuqPmK8unaldF+avTyzfk7OFXncAZltkoZM+NeW/PbXWge5zNDNi8YLKKQ0LmyoZcNLzs7/5M+IGocGybyOlrIW5PQDh5+vMeGlovsWUnQKlm/Bq9krpfu/Aq7uSg+G4PrBgzOiN+w+mIskIXcFEvtz+MHCUY/jVgWvSbE5ehCwWdBKPxhpCztjAUZ79QifZCsmuGjj9WFDdYkINKF3eBAuGZgzJnnIYTno68jOINGztWFenhj2kDj7o2xbHgbsyMwlKwLJ0WQkZ+PrecoQxIN8rCcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mNK6VbwCW9Qh4npgrIATfI0pttjgsHoeeZeoUynyMxw=;
 b=bgfgIETy0xcchzuNaGDubiYpFQ1R3eyGVBJ4a7FbrtpyMu9VwK/PI3olCVR2IRIrIXvZVfK95eQrrQsffK8+0rGL6vtL1XcPL9fRLr2jmZJQgnKy4DQT/Eh+DBslaSJYh8y/OIKwEmTyU5o2+L2dzfhIOIWwRXjkeDnL7G+SAgDoxEEt6ziJKpeIxxUv3gqIbv3IKBDM8pcN8GV3NklhlD0u5wRKeQ5E0/PONAiZhYQiFNcoiWgAk02U/yX86y6VUSEzu8rftWRZ1G3k786qX/WxYtUDpoRjg2BwmgMvAhvAkPrT2FRJiA51BdWX24/T4HjnwwaX3Qs/moG0sCZ6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNK6VbwCW9Qh4npgrIATfI0pttjgsHoeeZeoUynyMxw=;
 b=GZEYQ/9TLeX7j4kBmDxYQytOzuge1XFu1GpxJA41RLIg01mtnfpBtnrZ4Wmtq6u9v3lw6/8QhwuTjcFvJFyWoCyrupMkGYEdOcXvH12tLo9qC3lW+JyoHmhDIkc1LxiZBwuO2lJsXruXW0vEvbsg8VsSbcpQjcd6I9Kca4eMASI=
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com (20.181.187.23) by
 DB8PR08MB5340.eurprd08.prod.outlook.com (52.133.242.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.17; Tue, 21 Sep 2021 15:30:35 +0000
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::cdb5:1706:f526:cf1f]) by DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::cdb5:1706:f526:cf1f%9]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 15:30:35 +0000
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Hugo
 L'hostis <Hugo.Lhostis@arm.com>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: remove debug and verbose kernel cmd line parameters from grub cfg
Thread-Topic: [meta-arm] [PATCH] arm-bsp/n1sdp: remove debug and verbose
 kernel cmd line parameters from grub cfg
Thread-Index: AQHXrtmk0wcVk2o8xkeJqGGfzfuMRKuunT1W
Date: Tue, 21 Sep 2021 15:30:35 +0000
Message-ID: 
 <DBAPR08MB55609ECD297B18987FEBB30D86A19@DBAPR08MB5560.eurprd08.prod.outlook.com>
References: <16A6D1F0F363870E.8939@lists.yoctoproject.org>
In-Reply-To: <16A6D1F0F363870E.8939@lists.yoctoproject.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3e0d0bbc-6d84-08e4-4eb4-df4212ee6819
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c7e9e52c-760d-4ac0-698b-08d97d14cc0e
x-ms-traffictypediagnostic: DB8PR08MB5340:|DB7PR08MB2970:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB2970AFE8A34C4BD2D45D426886A19@DB7PR08MB2970.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CsMuTZOsrqMhtsX/N5mFSTTqNcUb54rfsTz3S5BfCb6XBac78ns0nHYTcSASWMUGkai2Hgj+PWmCx5ccGxWcgqcZPCf81RiMpB0CjIf6UrhC3yHDg2sPwsn9oVqUnrNcbhe6MObmrU9Q087gdHYOzgAuDSbvisO7Q35zRDwBidybSdnATXV7atPDnfV0tL74GAQ2iOxPlIso9Ir5cJGNnFszHcIQhMvKyEdAKUxGH8SXFBdKjbhsIuKiCaY0hgU5FKPuVctRFpIUMT4VmM2J/HMhT2dGvtNX3dxGaJZCdbeG84J/0UygYDD3B/Pkt3LdjbuLxJNN3YTtjz9OcnbY8q4NSbHkwzReJZKuN08Ia3mLooEKVAMas5rJoVCDrkkrWQJl4Eqf9O8kdKZeAfmsKvsSpV5aq9gUOMLnZNp5I53jF/2w95DB7hrOvprFWR33tQCawUfMV7DH8jFktyG1x+AH8Vkd7LK820YyZkjfaICTicHWDg0ilAiyDHlroGpDkmm0DUWj1vBoTWInqUY+BBxmDZW1oOEz8rhJUz140YZhlUsVBawhbNCxnfGRxzwG/FJ7YU+6GW98Klj8xmo56UnDFahUlQfV00WspBFT1jknx+wQZ0Bh9kbwy6f5NaxM93ceRmgmya36+ABfKVXSSj86nJSH8wYsyllnXa5eF1K4xuoRpv7kQjI43NRCT14iMKQS3FbLiwJ0CfLgzpyeVvUvXwn5uWLvW9plKy4BnXQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5560.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(38070700005)(33656002)(110136005)(71200400001)(26005)(7696005)(55016002)(19627405001)(9686003)(5660300002)(52536014)(122000001)(38100700002)(66946007)(4326008)(64756008)(508600001)(66476007)(8676002)(66446008)(76116006)(91956017)(66556008)(83380400001)(8936002)(6506007)(186003)(316002)(86362001)(473944003);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5340
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Hugo.Lhostis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fb9fc204-e5b5-4da5-4a3c-08d97d14c1ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z9wgPNNTWhWnE/U3xOMmW3IDl9deTOHy29ccNkfeMtt6CFjCG06/QyIGjcKaz0r97i21vWJzQbDRXwc8U74drajxQAceOIO2xTdgXIk1nVae64IsvGSwRCJVIZmzLT+375dgDKNbLOEI+FtLzNdAK4d8nYCUBBDJSK/FiwBbHvv7KdiBwyxMH/LPaw3kKBkDgWVfENzgZ3LU5EFn/EmWbxYK2ELIwEooytDsRQZOYIGRh2rWVgrJCljasAz7SqXdBK+yI8mr0BOhxTPVAbSJBkdIVzdObRa+D+itTNkW6Ta6rrF4bvN8PkiYEQ3Wi3rcUcrIHZ0TwFBBCkW6X8bJEhkqUlJ4L4BjHpev6ZLvQTpTypujVvEnmSZBfzQCnQk8bJQbvAfYzzwulwFzs9aNWlnZYnDfH1eT+XQi32IdvPkA3V2Mkc09T84x1NQevDucAeglJBSfmy6iMuCIkQ619ITEv8qc0xYkL5NHUIcpYiFuw+0FFqfX3vwBe0RHvNP3GHu6gf5Wwrap3aM9NaZuy3WS9Pns7B85SKRUvLL/RN6B74vnP+TlJHHKrSt+RkSYIfCC66VJTaVq8V+k8GrqeilErxOQ22xKyiJeCVMDGJf46DfFMHp0uxHWTspuXwfl0kj0Ia4yDdpCS7Gag5LRpLZhlKd3s2Z/SinX5mc9NN5QlXNhaIx25sXe7BGznKkOiVvU7BVlKpv8kMEDn2XoWFBhM2lSXWzQDf7qCGLoUow=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(356005)(19627405001)(5660300002)(33656002)(186003)(26005)(70586007)(36860700001)(8676002)(4326008)(52536014)(336012)(83380400001)(47076005)(81166007)(316002)(6506007)(7696005)(2906002)(110136005)(9686003)(8936002)(86362001)(508600001)(82310400003)(55016002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 15:30:52.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e9e52c-760d-4ac0-698b-08d97d14cc0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2970
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB55609ECD297B18987FEBB30D86A19DBAPR08MB5560eurp_"

--_000_DBAPR08MB55609ECD297B18987FEBB30D86A19DBAPR08MB5560eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

Can this patch also be backported to hardknott please ?

BR,

Hugo
________________________________
De : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> de l=
a part de Hugo L'Hostis via lists.yoctoproject.org <hugo.lhostis=3Darm.com@=
lists.yoctoproject.org>
Envoy=E9 : mardi 21 septembre 2021 12:12
=C0 : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc : nd <nd@arm.com>
Objet : [meta-arm] [PATCH] arm-bsp/n1sdp: remove debug and verbose kernel c=
md line parameters from grub cfg

By removing the verbose and debug kernel command line parameters from the g=
rub
menu entries we prevent the console printing unnecessary messages and slowi=
ng
down the boot process.

Issue-Id: SCM-3027
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Ieb68c606b7ed5b20191f6989aea84963b8cda778
---
 meta-arm-bsp/wic/n1sdp-grub.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/wic/n1sdp-grub.cfg b/meta-arm-bsp/wic/n1sdp-grub.=
cfg
index 12b77a0..7323ec7 100644
--- a/meta-arm-bsp/wic/n1sdp-grub.cfg
+++ b/meta-arm-bsp/wic/n1sdp-grub.cfg
@@ -4,15 +4,15 @@ set default=3D"0"
 set timeout=3D"5"

 menuentry 'Arm reference image boot on N1SDP (ACPI)' {
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4 acpi=3Dforce verbose debug
+        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4 acpi=3Dforce
 }

 menuentry 'Arm reference image boot on Single-Chip N1SDP (Device Tree)' {
         devicetree /n1sdp-single-chip.dtb
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4 verbose debug
+        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4
 }

 menuentry 'Arm reference image boot on Multi-Chip N1SDP (Device Tree)' {
         devicetree /n1sdp-multi-chip.dtb
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4 verbose debug
+        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,115200 =
root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfstype=
=3Dext4
 }
--
2.25.1


--_000_DBAPR08MB55609ECD297B18987FEBB30D86A19DBAPR08MB5560eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can this patch also be backported to hardknott please ?&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
BR,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hugo<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De :</b> meta-arm@lists.yoctopr=
oject.org &lt;meta-arm@lists.yoctoproject.org&gt; de la part de Hugo L'Host=
is via lists.yoctoproject.org &lt;hugo.lhostis=3Darm.com@lists.yoctoproject=
.org&gt;<br>
<b>Envoy=E9 :</b> mardi 21 septembre 2021 12:12<br>
<b>=C0 :</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoprojec=
t.org&gt;<br>
<b>Cc&nbsp;:</b> nd &lt;nd@arm.com&gt;<br>
<b>Objet :</b> [meta-arm] [PATCH] arm-bsp/n1sdp: remove debug and verbose k=
ernel cmd line parameters from grub cfg</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">By removing the verbose and debug kernel command l=
ine parameters from the grub<br>
menu entries we prevent the console printing unnecessary messages and slowi=
ng<br>
down the boot process.<br>
<br>
Issue-Id: SCM-3027<br>
Signed-off-by: Hugo L'Hostis &lt;hugo.lhostis@arm.com&gt;<br>
Change-Id: Ieb68c606b7ed5b20191f6989aea84963b8cda778<br>
---<br>
&nbsp;meta-arm-bsp/wic/n1sdp-grub.cfg | 6 +++---<br>
&nbsp;1 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-arm-bsp/wic/n1sdp-grub.cfg b/meta-arm-bsp/wic/n1sdp-grub.=
cfg<br>
index 12b77a0..7323ec7 100644<br>
--- a/meta-arm-bsp/wic/n1sdp-grub.cfg<br>
+++ b/meta-arm-bsp/wic/n1sdp-grub.cfg<br>
@@ -4,15 +4,15 @@ set default=3D&quot;0&quot;<br>
&nbsp;set timeout=3D&quot;5&quot;<br>
&nbsp;<br>
&nbsp;menuentry 'Arm reference image boot on N1SDP (ACPI)' {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux /Image earlycon=3Dpl011,0=
x2A400000 console=3DttyAMA0,115200 root=3DPARTUUID=3D6a60524d-061d-454a-bfd=
1-38989910eccd rootwait rootfstype=3Dext4 acpi=3Dforce verbose debug<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux /Image earlycon=3Dpl011,0=
x2A400000 console=3DttyAMA0,115200 root=3DPARTUUID=3D6a60524d-061d-454a-bfd=
1-38989910eccd rootwait rootfstype=3Dext4 acpi=3Dforce<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;menuentry 'Arm reference image boot on Single-Chip N1SDP (Device Tree=
)' {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devicetree /n1sdp-single-c=
hip.dtb<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux /Image earlycon=3Dpl011,0=
x2A400000 console=3DttyAMA0,115200 root=3DPARTUUID=3D6a60524d-061d-454a-bfd=
1-38989910eccd rootwait rootfstype=3Dext4 verbose debug<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux /Image earlycon=3Dpl011,0=
x2A400000 console=3DttyAMA0,115200 root=3DPARTUUID=3D6a60524d-061d-454a-bfd=
1-38989910eccd rootwait rootfstype=3Dext4<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;menuentry 'Arm reference image boot on Multi-Chip N1SDP (Device Tree)=
' {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devicetree /n1sdp-multi-ch=
ip.dtb<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux /Image earlycon=3Dpl011,0=
x2A400000 console=3DttyAMA0,115200 root=3DPARTUUID=3D6a60524d-061d-454a-bfd=
1-38989910eccd rootwait rootfstype=3Dext4 verbose debug<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux /Image earlycon=3Dpl011,0=
x2A400000 console=3DttyAMA0,115200 root=3DPARTUUID=3D6a60524d-061d-454a-bfd=
1-38989910eccd rootwait rootfstype=3Dext4<br>
&nbsp;}<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBAPR08MB55609ECD297B18987FEBB30D86A19DBAPR08MB5560eurp_--
