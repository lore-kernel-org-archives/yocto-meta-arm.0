Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7514C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 15:50:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web09.46143.1635781827394315620
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 08:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=R7x1MkZc;
 spf=pass (domain: arm.com, ip: 40.107.22.74, mailfrom: peter.hoyes@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3zlnRzXfzmCkojzAersSXmbaKOY7TG18/j7S6odU7Y=;
 b=R7x1MkZczWSwva66ZdH8AC7FhZ7SXPqOJiPXpg+RniRP1Wr7oM2+Hgl7tbofdP2yTZyCSDfsRQ6tligzxKTpmXJwHLh8HeszZho9fmk79Gkiv5NTgmV5+A6H9OvDkGus+NnFB6AcKBkaD34f5GE3aVKk/QDNFXrB7hP9G5d9Ncw=
Received: from DU2PR04CA0201.eurprd04.prod.outlook.com (2603:10a6:10:28d::26)
 by AM9PR08MB7085.eurprd08.prod.outlook.com (2603:10a6:20b:417::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 15:50:24 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::24) by DU2PR04CA0201.outlook.office365.com
 (2603:10a6:10:28d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Mon, 1 Nov 2021 15:50:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 15:50:24 +0000
Received: ("Tessian outbound c71e1a752bff:v108");
 Mon, 01 Nov 2021 15:50:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4eb1de91ec342d0
X-CR-MTA-TID: 64aa7808
Received: from 8153ba44de61.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 163DD1AB-E275-4239-9C5C-43C254710066.1;
	Mon, 01 Nov 2021 15:50:17 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8153ba44de61.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 01 Nov 2021 15:50:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbBepZfgx8RGd+LGjH815R6fFFMvXwampoAr+kBA1CuRGkMCuRs6uuXsxu8xdGGkMA5/6A9iR/VBcQVNOt5aADVX8kWGEIJ8vYUHPQ5U78Yt7mZbHYBfIer5xsvqr1lFxJjQE2xqMh/xBcq3TLFZcfQPm9XtbSWaX6ExQsERoNMhLPlCFzoKJazWQnr+3TTaMiBCSnG1XziDZ8o0+BW9G/9WVs9R7PjRmM8OmDxTNnf7PjUiAWBM3Og19qeW/ECeDIFK/kP/6LUjlX5Kk9iGjQrXsYqFyEgMjCwFjHFICGlM9nieHyu8qFu1zsebcsV/r3Zc8H9x9sZIt0XLvcJ47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3zlnRzXfzmCkojzAersSXmbaKOY7TG18/j7S6odU7Y=;
 b=JH3Ei+xwOdiKK1Eq2XQHMULQJg8QslIHJ8wTs/WHZ9x3h5sXwV5KYG8LsazzTHilMgyFoBaiPmiiirsh7j529hzAJo71UqE1NGSRg5cx1EoS2eJYpBpOkGZlzK8aNGqorj+n1zMi58fE6LBidOLMohS+bLCvEQXg42lrItaCN+axmU7kdZ/EAZ7TRBbjii/lIKfp/TZEKYEgJ/0J3bBv2koRGXPevvn4wID6QWB/BUkmXH2LVkieQGNnDLm6tsig/RFG2qJsGOul6xg1K08GK8epmI6YI8nJloabiIHoq4SVyJzlQQaIRGBdvRn5WfbASjx6Y2l0spd5uQS5959bSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3zlnRzXfzmCkojzAersSXmbaKOY7TG18/j7S6odU7Y=;
 b=R7x1MkZczWSwva66ZdH8AC7FhZ7SXPqOJiPXpg+RniRP1Wr7oM2+Hgl7tbofdP2yTZyCSDfsRQ6tligzxKTpmXJwHLh8HeszZho9fmk79Gkiv5NTgmV5+A6H9OvDkGus+NnFB6AcKBkaD34f5GE3aVKk/QDNFXrB7hP9G5d9Ncw=
Received: from AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19)
 by AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 15:50:15 +0000
Received: from AM6PR08MB4280.eurprd08.prod.outlook.com
 ([fe80::a1ef:2d00:96bb:ab94]) by AM6PR08MB4280.eurprd08.prod.outlook.com
 ([fe80::a1ef:2d00:96bb:ab94%7]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 15:50:15 +0000
From: Peter Hoyes <Peter.Hoyes@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: "ross@burtonini.com" <ross@burtonini.com>
Subject: Re: [meta-arm] [PATCH v2] runfvp: Ensure new process group is in the
 foreground
Thread-Topic: [meta-arm] [PATCH v2] runfvp: Ensure new process group is in the
 foreground
Thread-Index: AQHXxm07aqeAEJLWg0yl9ZhytIxnHavu40IQ
Date: Mon, 1 Nov 2021 15:50:15 +0000
Message-ID: 
 <AM6PR08MB428068EAD2DA7AAA4833CF5DFB8A9@AM6PR08MB4280.eurprd08.prod.outlook.com>
References: <20211021111657.663065-1-ross.burton@arm.com>
In-Reply-To: <20211021111657.663065-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: d385c64e-0da4-61b0-4f8b-3f8c4d7b1c1d
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4fa8a82c-3b48-41ff-a389-08d99d4f5182
x-ms-traffictypediagnostic: AM6PR08MB4600:|AM9PR08MB7085:
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB70857C6B5F5B30298A007D10FB8A9@AM9PR08MB7085.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JmxKt7Ohfv4JuwAS+IglCGXT33AboZRNP8IszcBh7WEqRcyIwyw0YQCcWfazpr2gCcDY4bGRJAVJim0lJn2Jj5cgUu1JbSRRHX4jzgXuWj7+GYouchFkZB6eQp4Rv9nP0uTjazU3ZCiXbuldotl1piax24F1iFUMGFn/5lFXUnqC/doorZ3UWjoGOsQVo7QFXityceIZhIslOE+UqKhJgb7sj2vEY3E+9mkn/qiBYlV7Kr7Q2FEBVJhyg7e4Q1row2f6oODXxC+E25JBb00uIKrmPq2uEuy+h/RUBkym3LIqJ5qIzwlmuBUZjAaLfQz/3bAqzIvLiqJIFoMgLzvupX2nV+dughZx5HMVMQ06NoFoJvwTt+9AA2LNJvkBv1MToSc/g1/vZpdnQ26CKPPt3E1SKD71bkKH8iQnvz5g0ajFxchKrC4rpYEjKOr/XGSAT1juIoQADprVcAf89tg53f9fFgy4emv1gN+iKwdtN5618QdUy6APx6c4ZzH+LLQGzRCuRyMEjK4LD3vOkhYYoh5V5Pa3xS+SSNdYk5/oVkO+Qi1+UVz3HPT9MWAqEQLf55xJIL6IURZ3v8EZkzOLYjbQqFItHw35Vzizrjf6b5rLRQVl2L1bkt/n2lr4vO+ew3j84wB2meM5UuszgT1c0Fj2ZmuLiMQR1qH0bUHjZU2rEMFzVaAbm5Q+vl4zRgIX1ekObuBZP9t1x3xV68LCvw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4280.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66446008)(66476007)(64756008)(38100700002)(26005)(76116006)(5660300002)(8936002)(9686003)(52536014)(8676002)(71200400001)(186003)(86362001)(6916009)(33656002)(19627405001)(6506007)(7696005)(66556008)(55016002)(122000001)(508600001)(316002)(83380400001)(2906002)(4326008)(38070700005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB428068EAD2DA7AAA4833CF5DFB8A9AM6PR08MB4280eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a9c668d4-4a12-478c-5fbd-08d99d4f4bfe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6FCqWAC9G72tif09wTvaxlgGALcf8rw+ahW7Zu7Qe+l0bQe8Nok/i6y6yh33+sco74WlPgyIEk8LB03VUGeyYg5JWZUtRJsbUh3s5JlmxTJVkMIHB4MDF/l4PU/vN8G33mD+t0cgcrVlmueHp1IYqtqUTnJrkHeuSr5DZz0EsEUjK21VD3GqAtoOHLs2yxqLn92XpwllYD/agvUUHBLsXl5YruozplzkjQd/gR63B5o6Eb/0urxdLPsyA6wy+/V55DzGq5/BO2OakjhdSZY2jm/QZaLGXdQ8xgSecDHNdAYd/47YSgyC9//gPdCBhNCFLV/iJQ7j6G1bLJzbiC3mwfKvjAmXtJKbQCj2T3ATH4HDKAifaNEHeINTIrtH6eL6aaLmAfQ5vkkSwFQNS+pLQExnXEsrXFEgAuPf63iOoF8aIjkNx+3NSKd9MrdiXZcPXadZrRO8/lQcnDCWfnoKR10IyNpAqVHiSCP0I1WjLiLKmdilvcdg5lfosOHNAvJjE82BwzkT1jjyUYWyR0zJS/vQR//phMjSNAP9QycEQKzbu1PEsYsWtehhsFcAjKLR4uWWdNtJCqZAFAEHJIsjbapP2aFViFiF0rRs0Y5zexKAmkUrAiJ1kka9OWIWFckTyBjY2wqNMUSKZyKyy8bfFQXHUyUUcxLK5a+PBIHnlLwbJoqckMhVYL9g4WwtdWa8Bi8ikOyv+hQ144g/13nR2w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(26005)(47076005)(8676002)(70586007)(107886003)(316002)(55016002)(83380400001)(9686003)(70206006)(336012)(5660300002)(19627405001)(186003)(33656002)(2906002)(6506007)(356005)(508600001)(36860700001)(52536014)(81166007)(86362001)(7696005)(82310400003)(6916009)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 15:50:24.5039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4fa8a82c-3b48-41ff-a389-08d99d4f5182
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7085
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Nov 2021 15:50:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2328

--_000_AM6PR08MB428068EAD2DA7AAA4833CF5DFB8A9AM6PR08MB4280eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm seeing the same issue on honister - is it possible to backport this pat=
ch?

Cheers,
Peter

________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Ross Burton via lists.yoctoproject.org <ross=3Dburtonini.com@list=
s.yoctoproject.org>
Sent: 21 October 2021 12:16
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: [meta-arm] [PATCH v2] runfvp: Ensure new process group is in the f=
oreground

From: Peter Hoyes <Peter.Hoyes@arm.com>

When a new process group is created, it is launched in the background
and any attempt to access the session terminal triggers a SIGTTIN (for
stdin) or SIGTTOU (for stdout) signal. These are ignored in an
interactive shell, but the default signal behavior in a new job is to
send a SIGTSTP to the whole process group. This causes runfvp to hang
when executed via a subprocess when stdin is accessed.

After creating a new process group, use tcsetpgrp to make the new group
the foreground process for the terminal associated with stdin/stdout,
but only if stdin is a tty.

The documentation for tcsetgrp states that tcsetpgrp itself raises a
SIGTTOU signal, so set this signal to SIG_IGN.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I349a825df7fcb8a3cedb81762b901c6f50fa53b5
---
 scripts/runfvp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/runfvp b/scripts/runfvp
index 97836726..66a76cc5 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -4,6 +4,7 @@ import asyncio
 import json
 import os
 import re
+import signal
 import sys
 import subprocess
 import pathlib
@@ -220,6 +221,9 @@ if __name__ =3D=3D "__main__":
         # Set the process group so that it's possible to kill runfvp and
         # everything it spawns easily.
         os.setpgid(0, 0)
+        if sys.stdin.isatty():
+            signal.signal(signal.SIGTTOU, signal.SIG_IGN)
+            os.tcsetpgrp(sys.stdin.fileno(), os.getpgrp())
         runfvp(sys.argv[1:])
     except KeyboardInterrupt:
         pass
--
2.25.1


--_000_AM6PR08MB428068EAD2DA7AAA4833CF5DFB8A9AM6PR08MB4280eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I'm seeing the same issue on honister - is it possible to backport this pat=
ch?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Cheers,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Peter<br>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-arm@lists.yoctop=
roject.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Ross Burton=
 via lists.yoctoproject.org &lt;ross=3Dburtonini.com@lists.yoctoproject.org=
&gt;<br>
<b>Sent:</b> 21 October 2021 12:16<br>
<b>To:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject:</b> [meta-arm] [PATCH v2] runfvp: Ensure new process group is i=
n the foreground</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Peter Hoyes &lt;Peter.Hoyes@arm.com&gt;<br>
<br>
When a new process group is created, it is launched in the background<br>
and any attempt to access the session terminal triggers a SIGTTIN (for<br>
stdin) or SIGTTOU (for stdout) signal. These are ignored in an<br>
interactive shell, but the default signal behavior in a new job is to<br>
send a SIGTSTP to the whole process group. This causes runfvp to hang<br>
when executed via a subprocess when stdin is accessed.<br>
<br>
After creating a new process group, use tcsetpgrp to make the new group<br>
the foreground process for the terminal associated with stdin/stdout,<br>
but only if stdin is a tty.<br>
<br>
The documentation for tcsetgrp states that tcsetpgrp itself raises a<br>
SIGTTOU signal, so set this signal to SIG_IGN.<br>
<br>
Signed-off-by: Peter Hoyes &lt;Peter.Hoyes@arm.com&gt;<br>
Change-Id: I349a825df7fcb8a3cedb81762b901c6f50fa53b5<br>
---<br>
&nbsp;scripts/runfvp | 4 ++++<br>
&nbsp;1 file changed, 4 insertions(+)<br>
<br>
diff --git a/scripts/runfvp b/scripts/runfvp<br>
index 97836726..66a76cc5 100755<br>
--- a/scripts/runfvp<br>
+++ b/scripts/runfvp<br>
@@ -4,6 +4,7 @@ import asyncio<br>
&nbsp;import json<br>
&nbsp;import os<br>
&nbsp;import re<br>
+import signal<br>
&nbsp;import sys<br>
&nbsp;import subprocess<br>
&nbsp;import pathlib<br>
@@ -220,6 +221,9 @@ if __name__ =3D=3D &quot;__main__&quot;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Set the process group so=
 that it's possible to kill runfvp and<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # everything it spawns eas=
ily.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.setpgid(0, 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if sys.stdin.isatty():<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signal.=
signal(signal.SIGTTOU, signal.SIG_IGN)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.tcse=
tpgrp(sys.stdin.fileno(), os.getpgrp())<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runfvp(sys.argv[1:])<br>
&nbsp;&nbsp;&nbsp;&nbsp; except KeyboardInterrupt:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB428068EAD2DA7AAA4833CF5DFB8A9AM6PR08MB4280eurp_--

