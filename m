Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9F9C7EE29
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:27:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.78])
 by mx.groups.io with SMTP id smtpd.web11.19126.1685039260673146480
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4S9VdayG;
 spf=pass (domain: arm.com, ip: 40.107.7.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vCMdmyhR2hUn0qgrZaP/VQCJ8U5YpVyy96qyjU8V70=;
 b=4S9VdayGbORCJIi7eFeWToopn+P1aPoE1z1uwWOUa09i9iwySmPGOGCxzjX7g49j2lx947ccBfVNkLIs4mB7LpqfniQwGsIW1oHq3rUvm5fSfn+Ym0PDg87L6BnP1lh3PmlIWezx6ftcviSpruD0xjTnvU4vxbYXIg+J2e4cRYw=
Received: from AS8PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:20b:313::23)
 by GV1PR08MB8691.eurprd08.prod.outlook.com (2603:10a6:150:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 18:27:32 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::c2) by AS8PR04CA0078.outlook.office365.com
 (2603:10a6:20b:313::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 18:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 18:27:32 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Thu, 25 May 2023 18:27:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7496cac221214b5
X-CR-MTA-TID: 64aa7808
Received: from a4f8f631c8d9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0C5A74BE-F2E7-4F21-AEB5-E9334439E0B9.1;
	Thu, 25 May 2023 18:27:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4f8f631c8d9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 May 2023 18:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckW1YwHSXvbKeFBmD7Y+fuNYohNwrIJYDEBMY6JgZ8blGmNZjePsPO45N8dDbDpjec2yns+5JMr1ASUDe//XqOEv1+g8gJihN6fukCPln20Zc3NFBtfmC6MSc5BsDqcJzeXbzNcJjPi5LK/WXlMnvvYAIdsDBKXWRNQsHVjyvrpq7bwtGeYBJiwbhlsFeEJbPdmkzCMHryRZ1Itd11MlKYgCQnsR+O6GV9vUZQCbmElx5B0WGDlvCyuArAgnPpMZMgBd1WEmF61isHex6lwZOPn3Rjxhgoe8pVxYvkV3PbzT10Mj0Lk0Obeo9vPWqmEhtij6iO3KIrcZd0AyIU/R1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vCMdmyhR2hUn0qgrZaP/VQCJ8U5YpVyy96qyjU8V70=;
 b=hspa4rg5VVWe0rXlMhRP17/w7Kej9i8vXEGjtRVgqf8whY0d2/6stvyFiB32ZCmHLAyAhvZuvtTVuCD21bqhtObPKtGdSBViuynjDrSbfR3Og9hCSrKqsUYU+F4Qp50LeFV4C4KKanS7U0rh2yGDnMBO6KZrdrJSgCKHGk/rzm2pHIyiV+98Cp7zEdQLjcnjZ63qj9Wmyu0pg2qcrMTw2we/lMdDCYArPnNQaC7TC9ARDFGAPwT6bQeSIdtKSqD9pqIS5R3OXNITDo4fX4didjYQNAkQtg5+B2RL6VLhqpMhofBC08E+5y6rv/RzUbP2CUEQF9mZARkMNKlcC2JYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vCMdmyhR2hUn0qgrZaP/VQCJ8U5YpVyy96qyjU8V70=;
 b=4S9VdayGbORCJIi7eFeWToopn+P1aPoE1z1uwWOUa09i9iwySmPGOGCxzjX7g49j2lx947ccBfVNkLIs4mB7LpqfniQwGsIW1oHq3rUvm5fSfn+Ym0PDg87L6BnP1lh3PmlIWezx6ftcviSpruD0xjTnvU4vxbYXIg+J2e4cRYw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10137.eurprd08.prod.outlook.com (2603:10a6:10:4a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Thu, 25 May
 2023 18:27:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 18:27:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/lib/fvp: remove redundant trailing
 commas
Thread-Topic: [meta-arm] [PATCH 1/2] arm/lib/fvp: remove redundant trailing
 commas
Thread-Index: AQHZjzZ5KsbZntYIlUqhjNrl8bzVwq9rTp4A
Date: Thu, 25 May 2023 18:27:23 +0000
Message-ID: <F32D3303-B0E4-41B9-B332-3797BBE36C5F@arm.com>
References: <17627634DEF15D0B.2469@lists.yoctoproject.org>
In-Reply-To: <17627634DEF15D0B.2469@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10137:EE_|AM7EUR03FT020:EE_|GV1PR08MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a354b1b-5ef0-4e33-8f93-08db5d4db467
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fXJXYSjA7iZ4z5eS79G7bbFx7+6kvCifP7EhIWW7xTGkdj9ufjsnVaLmTdKXvNXQFqwmG5lmk7f9MyIZLBPtfPV6perid9migBIEvgaD3RCdUNMZAJmQb4l4ANIItpl2VmJh82tFkbFRRXeGt3aBARS07dFTAxvO8chP7y1mv2IPcoQwGzPoWjCm0XmIzZ1MMvBmJ6jlh0TdKp/sh0G2giehXylHlF7mafymuqLotRGWRRbB17I9KBm393R9re3zXRL4xYS1UiHSyffxqJlUf+lqc4ul6ktJfMCjxZDf/yN4o8D/Q0WCYwNqSs2tS00Jy3M4glHJ+I31zWaQdnbIkAjz/k6lW5srpSZZR3I0/6wwPX8xd4jvbeWyJHLJhka7r7BhZ+lmPGzEicxHCrxJfdsMjxiOk23qMPr6B+A7stDx2HKlg2oHmRAZ/VBNFVwXWCkzMoiqj9hV7h1wEM3MeBXplTHlYAiNd08xI005wopgM5mpssShzOYsDPWTcJa/uAuz//2uBUPc9Ar4ozqbn4uufhpTYHcJc9p6fmOx0F+QrhRo9oPc0D183+IjGPqyyLi6bbWXyA2WRKqdeBvSqUYeyu0c9N+kGZSn983N4dVPv3GLiddX65R5swsWQkQQgbN9hEqGqce1HJx4b0xvh5gsLvZ+CryLLESHM1ocdA8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(6506007)(6512007)(26005)(53546011)(36756003)(186003)(478600001)(966005)(6486002)(71200400001)(8676002)(8936002)(41300700001)(83380400001)(316002)(38070700005)(38100700002)(86362001)(5660300002)(2906002)(122000001)(2616005)(66899021)(91956017)(66946007)(6916009)(64756008)(66446008)(66476007)(66556008)(33656002)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <017AF6414573A64FB06D2CC97D7CDE88@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10137
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4b2aaa5e-13d0-4145-1d8c-08db5d4daf13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a+sVJ97n5/d15oy/G/fNxbVlmcpeHt327UHWOOUqGeTDZexskwF44Em92Z5QaDOkLOOn+acwut81qyEx3n6c15UiXyx9/ox51UiWM4Uxb3Gn86kQE22a+XqJfqJroNiMFu4n8H0R47wMbNcpeY9SpA+JW17aLlX+wvb83NimvlV5XIsVyUNg1OzcZwX351JnIz/QWlyASh7bdSgRsce8lb8yGmNP6NNtIIn1+kk3UUab4y0dDOIZzpJMF+uJtGAA6Uikqd9jQMMxYAhVQmJZI0KOeayCPBtBJLHPhw8WadssQDFIYsKHppCQ+jINakaY6Q9+oEZ0UhwVuff33d44oPpr9FRI/bIIgC880dfD1ezI/q97EPDuN+KMhYFsaljoN8ubfdDdoEGrndwa2P3OU8Zt7K0XbdDT7prOSurSAeV815RN9mdFgujJkvBnTr2iuJCiBD81VdT0lm9wSXrACMzT2Tfbt7j1ybOtw+ep8DOh8QY29UdY9dR5MXFcOSJhovvuLTc8t/qsn/VlXzTFJUuV+Ssj7yKfYhoppGljXy/HAOsDu6sTtvuNM+JB1/jO940wTLxUvJMPtxC508Tyw5p4Aumwz+NlQSXlkDj/PJ4NgUDRoPmNZYifobm6kEB1vLcYCRiSYn5UoEPBZEtOvlgGYTQgHMuuw0ZR/aMTm8aEuYIKoZ9eQuEQHGbFn0r2Q/2GALga84wy1CNE/Heq5qu7VXiHermQLFLHFvITi/nMd5o6GwCJ7jkQwdts+hzsmd/bL95R50pNaO4WUiY9JA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(66899021)(966005)(6916009)(70206006)(70586007)(478600001)(316002)(86362001)(33656002)(36756003)(83380400001)(47076005)(26005)(6506007)(6512007)(36860700001)(186003)(2616005)(336012)(53546011)(5660300002)(41300700001)(8936002)(8676002)(2906002)(6486002)(82310400005)(40480700001)(82740400003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 18:27:32.3139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a354b1b-5ef0-4e33-8f93-08db5d4db467
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8691
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 18:27:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4705

Managed to re-send these, ignore.

Ross

> On 25 May 2023, at 19:26, Ross Burton via lists.yoctoproject.org <ross.bu=
rton=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Ross Burton <ross.burton@arm.com>
>=20
> These were left behind in a refactor.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta-arm/lib/fvp/terminal.py | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arm/lib/fvp/terminal.py b/meta-arm/lib/fvp/terminal.py
> index 6f408153..243d4fb1 100644
> --- a/meta-arm/lib/fvp/terminal.py
> +++ b/meta-arm/lib/fvp/terminal.py
> @@ -53,7 +53,7 @@ class Terminals:
> terminals =3D Terminals()
> # TODO: option to switch between telnet and netcat
> connect_command =3D "telnet localhost %port"
> -terminals.add_terminal(2, "tmux", f"tmux new-window -n \"%title\" \"{con=
nect_command}\""),
> -terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"%title\" --command \"{connect_command}\""),
> -terminals.add_terminal(1, "xterm", f"xterm -title \"%title\" -e {connect=
_command}"),
> +terminals.add_terminal(2, "tmux", f"tmux new-window -n \"%title\" \"{con=
nect_command}\"")
> +terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"%title\" --command \"{connect_command}\"")
> +terminals.add_terminal(1, "xterm", f"xterm -title \"%title\" -e {connect=
_command}")
> terminals.add_terminal(0, "none", None)
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4703): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4703
> Mute This Topic: https://lists.yoctoproject.org/mt/99109347/6875888
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross.burton=
@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


