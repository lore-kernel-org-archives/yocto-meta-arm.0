Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DF0C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:57:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web10.30576.1660751846001670422
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 08:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=u6zTkqPM;
 spf=pass (domain: arm.com, ip: 40.107.21.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m0g0SNUBpr/9i03FmCmrNpFF8Q2TCfima7DKNxag1Hs/Z2jD4IITpko3jXBoAs0775Lhc3epGwDMO/Rugg3bOtRhPWNx2kcrVvDkSrYhSHnc8g5C+mMhCDwVwygtI5AsLJ6FlvIAARhDraPoNyvy6oXdg7BOS4MzCF1Nw9LQG05U4HSTAJF6VtHNW0aWhmEVRx5PokWdz0jb3LU+O4yDDciTW0evR41dzZUfyj/WP34b6QQHBuwFLUO7n7dqyyrK3/lS91q6QXjiF0vNi4VS0TEc3RVg1LvNGaBaZVFFmDi6DX5RNM5aOeNwCWcS9wk/72M46Y56YrHqguCf6oBePA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xP3oT9P2XuXQ4AGaE62k8SpuCVK9DrqjTEEwzOTOFFg=;
 b=STHIN/Bj+j64OSWk15N2GYEqXosKAY21FZG4nxRQJYoJuZ8rnJNo30kV9DcrYr1sPhOPymJdWdOHFpgAZWLDPALJioyYuaWwoK/cFsjzRSshrP7HgTThonqNGtp0Jb2VtGkb9zKBp36vb0i8Vn6fxCXywyCuEaLqsZEzqWTYmgE5s5Q+2qFnjiSB8sje71gOiCIW3WOEqDEKhzG+3rrhxPy5n5X5iP6mLTYWHtR2fUZCTJ91XxYsFy18EWDZHcrm1OP1zSYPgZXOZZ3VtuRUaPT7+6S86fT7BnYYjurM4N9CUqA/d3QLmBmYsl2r0GF1buOit5KStBLYm1lA74OYcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xP3oT9P2XuXQ4AGaE62k8SpuCVK9DrqjTEEwzOTOFFg=;
 b=u6zTkqPMoMOEmHZFNQMcPO8R88c3jQS6TL8+dH8Wz4gMa1wEVBQSKm/rZczR10eqErCYWoaPv/CmdLvO67Q5OQGihzMDkabd8eBaW2SIHjbwNWmtqX38ZN/W/FMU7GwchqANlQhOWsAvDgzZ8Rps574N8ZYRTm8zT8D5TV4Y+8c=
Received: from AS9PR06CA0593.eurprd06.prod.outlook.com (2603:10a6:20b:486::22)
 by AM9PR08MB6833.eurprd08.prod.outlook.com (2603:10a6:20b:30b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:57:21 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::c1) by AS9PR06CA0593.outlook.office365.com
 (2603:10a6:20b:486::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Wed, 17 Aug 2022 15:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 15:57:21 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 17 Aug 2022 15:57:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ab174dd8b3b0313
X-CR-MTA-TID: 64aa7808
Received: from d13bfa9d8db1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77862042-AFC0-4AA9-9310-74D1021D6176.1;
	Wed, 17 Aug 2022 15:57:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d13bfa9d8db1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Aug 2022 15:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzPdgyQSMgz/Hr3Ehpo2qe3wPK+8WuU/lDlzuT5MpE28IeVZzsQzsidCuZdHt7TbTprGjfHjUPJLooVb5waqiRTPX+rnMn5UGVPlb4oi/mjBQnAO+SywdNjfhSk9T+qEZRX6C6Mhlu0VZaH7Ssq8LMQORSOm5dOM1JGSyL6w1PWNDlcgwtym+u4A2h+V8esK2LgxP4qGGJkR70SP4QyrjYhtEVj2XK1VFMpNR9YvYiRazT04Y+AUMbZUhDmLsIZEVNMNgKyMwaId9mU1SF6OBnXOluv+7+nvjaI+ix3Y00g9fkwWfdKpQqm2BrjcqHQXdcREwZox9361x22yBGTW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xP3oT9P2XuXQ4AGaE62k8SpuCVK9DrqjTEEwzOTOFFg=;
 b=b6ZwMqJAUCIjRfhw2EfO6cAwIKgPVTUbDs19SxljHinMbNwoev58vhKSs4JrbkA4v0LRWGYiqUY3yemUmpBwtu8wNbvi5xxKAfB4e/W9dCi153Ad35RQoeSEBF+QuyMrKSgslWMfD8jaIoHnSAJlCwOn4vjYq+o5MhZ0VvWCfxDV4BN9Oibg/Uzh3S1LxmiTYuRLf84QFZ8gnXnpU7ivS6H3PNjTLYwraBIg4PljTiCT6klwmKo/tbjB22BKZ62RPpDey7IKBkbGILlOHxW1oFRLarzaMMTpIuQb2k8CxjD0gNlCt7+9bTr3G5A1V1r3Bf6Jr7ZDlpy9P8F0/cWMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xP3oT9P2XuXQ4AGaE62k8SpuCVK9DrqjTEEwzOTOFFg=;
 b=u6zTkqPMoMOEmHZFNQMcPO8R88c3jQS6TL8+dH8Wz4gMa1wEVBQSKm/rZczR10eqErCYWoaPv/CmdLvO67Q5OQGihzMDkabd8eBaW2SIHjbwNWmtqX38ZN/W/FMU7GwchqANlQhOWsAvDgzZ8Rps574N8ZYRTm8zT8D5TV4Y+8c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB5922.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 15:57:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5d1d:a902:c842:14ba]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5d1d:a902:c842:14ba%4]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 15:57:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jon Mason
	<Jon.Mason@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	"swat@lists.yoctoproject.org" <swat@lists.yoctoproject.org>
Subject: Re: binutils upgrade will break tf-a
Thread-Topic: binutils upgrade will break tf-a
Thread-Index: AQHYsk1y8J0hsat8qUS1THaZSW6pvK2zPzeE
Date: Wed, 17 Aug 2022 15:57:08 +0000
Message-ID: 
 <PA4PR08MB7411AEB0965D48E535B6F76CE86A9@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <Yv0IJDV3IRFaYIJe@mail.local>
In-Reply-To: <Yv0IJDV3IRFaYIJe@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c0434949-cea5-44e9-2d3c-08da80692b58
x-ms-traffictypediagnostic: 
	AM9PR08MB5922:EE_|VE1EUR03FT045:EE_|AM9PR08MB6833:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5vRELz9hIMsMIcF8geEwjeI0ybGTiVWa26Oy+mNbx0+mDwOJ4SKKCYvP+qTpeShYzHBX74YnsPhmCuzKuo3VpzpvHUScDI5vrCZk5UCl/V9QfT8iPGjPUJ2Mu2G8fJTYiJrk3cLr/S+CDt9NG/rouk17vbN85Yw/MuexM7q4YkhAKN6QVPAXZj9cA/AQV4c/vhOMH87oEOZIOWzKgH+xVwudRJUZg4N5Ub66qtOtr6L3a34v2Dlya8Ryy06oqF61NfvDq0YvU45BG4kNx3o5Qh90BHADCLUy/8FIm9H53WjIdka464pHpipt0FeSK++vI1so9Ep0WT7J8mafTRZwlvfAUrwEvjN3L4HhAoYb7M+0t2FRC/HVTWxwxf2/CbqGEKmG5wyATTYjGpQzfxBQjHB5HlFZwShiKVesDed4vpVBZ+uwq02ORsrHQnL120jmiS5nFpP0QoW6Sn+fenGBbGdrbSDEj2x4p0tTU5TjKGM0Dxa2BPIa3gQQlDG6wftDftZ2mewQa9DMCMXZLHUR/+MubOihEL6BAzT8T7NNBOeXEZjdkM6nh4bsyBEHjnl4dJGcuYUhLjj1vW9isSqMkM0L3AwPtc+DJ8S60CuwURcDN9h8Od9UZdG4xUt9L5xOzrE6glewB7/jOlEKPCAaJXTlFC81x6yiqC5jysFV12kmBYLwAyf2Z8XNtpRFtCh33DAx6uLtWkNK9kUMTU9rlBFGeZEhBXdeYce9bNk7lXkgQBzaQRC3+kNYAO2r71fQhl6YiFto1Hnn57CZx91I82OIqV9NmWrf4N+6L6TjsQirCusfFZvFrOtK37qS1iITcA1LyIIyfq/WFMGKsYUliQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(6636002)(71200400001)(966005)(41300700001)(54906003)(316002)(478600001)(38100700002)(4326008)(66946007)(110136005)(8676002)(5660300002)(66446008)(66476007)(30864003)(8936002)(66556008)(76116006)(52536014)(64756008)(91956017)(26005)(2906002)(38070700005)(122000001)(186003)(86362001)(53546011)(6506007)(33656002)(166002)(83380400001)(7696005)(55016003)(9686003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411AEB0965D48E535B6F76CE86A9PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5922
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2ff85a64-ef5a-4f72-2247-08da80692372
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5Kq58YIL5rwJ26s/su2cXMm+BdbN1m4WyhjmUyhu4pNdOylxBorngg5slvhtABgMdMo91Lz6DqbGJrZ+T4T78grwLqwkepycdFy4slHj22JIuFwJiL8nUUptCk3SXI88cl/Xp9D0K1P648kE5CfYJ12Wh4oT20xaaIW/mt+HAJIc7Qf3VMopnYEbaUPTiaxo30WroZKvSCqFT9caKFHYGpS43vM6K66oZUV+l9+4+C+OryB4L1Htcn5qeIPKni4i++Qmk4SMYpYdaSOJiS4aSjTBEQNPYwRzpWi3tnbTEtWMvH5ROZA29CEyaga1NJsnpMS/tcY8TQ1Y9nTJZpPdaK4oxyL+zOsH+Flq+Z/EnEsQkylglIbWbHJoT/9su5AIg5K7JTxlmf1ezXbr22KVmMPIheBlmFzQDgHY3jFi8UBAh6cMH8F+Obcsx7sip7WtdrEMP2BRtV6TsqGYP4Ht5PUd7lxtXXl33rUXgsp7uuYlC8FdUuZLpDdK5gvJhgI1OTV/kQh3uV4ZRoCy9VRp5XvSI4HuqlaAT/Il7bB5VXwhWRs/JIovA7O9csTCYMgODcrwBrHRGvhwcVIGmBVfvkTI27EMcExk78cI9ZaI1GMAmnALOJq72/cTcSs0qb7dxfpBnzfIV7mYkLaiiht1OehcU9N3ulItzlRorhxGlH3HY7C1Njz1cX/vXcEUC0plX0+mk+cUWyS/NHXQFsnFk/51fTM8yYDwjA+Ls8BL0youETRbXIGilozKrKumWR7EsXPfyhUiR+hjcYmIZOJGHycxQt80neOxIF5Hod0h3D0VoUJYttAS+yH7+3YT71WuoUW//yGuZr2DFe3R7Qt2HQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(40470700004)(46966006)(36840700001)(26005)(82310400005)(6506007)(53546011)(55016003)(9686003)(110136005)(40480700001)(186003)(6636002)(478600001)(316002)(966005)(7696005)(81166007)(86362001)(166002)(40460700003)(336012)(41300700001)(356005)(82740400003)(54906003)(52536014)(47076005)(36860700001)(83380400001)(8936002)(30864003)(33656002)(450100002)(4326008)(8676002)(70206006)(2906002)(70586007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:57:21.1759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c0434949-cea5-44e9-2d3c-08da80692b58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6833
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Aug 2022 15:57:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3701

--_000_PA4PR08MB7411AEB0965D48E535B6F76CE86A9PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks for the headsup.  The relevant upstreams are aware of this so we=92l=
l pull their fix in as soon as it=92s ready.

Ross

From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wednesday, 17 August 2022 at 16:24
To: Ross Burton <Ross.Burton@arm.com>, Jon Mason <Jon.Mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>, swat=
@lists.yoctoproject.org <swat@lists.yoctoproject.org>
Subject: binutils upgrade will break tf-a
Hello,

The upgrade to binutils 2.39 seems to cause the faollowing build
failure:

| aarch64-poky-linux-ld -o /home/pokybuild/yocto-worker/meta-arm/build/buil=
d/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/=
bl2/bl2.elf --fatal-warnings -O1 --gc-sections    -Map=3D/home/pokybuild/yo=
cto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwa=
re-a/2.7.0-r0/build/fvp/debug/bl2/bl2.map --script /home/pokybuild/yocto-wo=
rker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2=
.7.0-r0/build/fvp/debug/bl2/bl2.ld /home/pokybuild/yocto-worker/meta-arm/bu=
ild/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fv=
p/debug/bl2/build_message.o /home/pokybuild/yocto-worker/meta-arm/build/bui=
ld/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug=
/bl2/bl2_arch_setup.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp=
/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/b=
l2_image_load_v2.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/wo=
rk/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl2_=
main.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-=
poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/desc_image_load.=
o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-=
linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fdt_wrappers.o /home/=
pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tr=
usted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/tf_crc32.o /home/pokybuild/yo=
cto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwa=
re-a/2.7.0-r0/build/fvp/debug/bl2/uuid.o /home/pokybuild/yocto-worker/meta-=
arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/bu=
ild/fvp/debug/bl2/sp805.o /home/pokybuild/yocto-worker/meta-arm/build/build=
/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/b=
l2/tzc400.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_=
base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/v2m_flash.o=
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/delay_timer.o /home/po=
kybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trus=
ted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/generic_delay_timer.o /home/pok=
ybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trust=
ed-firmware-a/2.7.0-r0/build/fvp/debug/bl2/io_fip.o /home/pokybuild/yocto-w=
orker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/=
2.7.0-r0/build/fvp/debug/bl2/io_memmap.o /home/pokybuild/yocto-worker/meta-=
arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/bu=
ild/fvp/debug/bl2/io_semihosting.o /home/pokybuild/yocto-worker/meta-arm/bu=
ild/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fv=
p/debug/bl2/io_storage.o /home/pokybuild/yocto-worker/meta-arm/build/build/=
tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl=
2/fconf.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_ba=
se-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fconf_dyn_cfg=
_getter.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_ba=
se-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/semihosting.o=
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/mem_region.o /home/pok=
ybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trust=
ed-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_bl2_setup.o /home/pokybuild/=
yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firm=
ware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_err.o /home/pokybuild/yocto-worker/=
meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-=
r0/build/fvp/debug/bl2/fvp_io_storage.o /home/pokybuild/yocto-worker/meta-a=
rm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/bui=
ld/fvp/debug/bl2/fvp_security.o /home/pokybuild/yocto-worker/meta-arm/build=
/build/tmp/work/fvp_base-poky-linux/trusted-firm
ware-a/2.7.0-r0/build/fvp/debug/bl2/arm_bl2_mem_params_desc.o /home/pokybui=
ld/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-f=
irmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_bl2_setup.o /home/pokybuild/yoct=
o-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware=
-a/2.7.0-r0/build/fvp/debug/bl2/arm_dyn_cfg.o /home/pokybuild/yocto-worker/=
meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-=
r0/build/fvp/debug/bl2/arm_dyn_cfg_helpers.o /home/pokybuild/yocto-worker/m=
eta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r=
0/build/fvp/debug/bl2/arm_err.o /home/pokybuild/yocto-worker/meta-arm/build=
/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/d=
ebug/bl2/arm_image_load.o /home/pokybuild/yocto-worker/meta-arm/build/build=
/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/b=
l2/arm_io_storage.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/w=
ork/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm=
_nor_psci_mem_protect.o /home/pokybuild/yocto-worker/meta-arm/build/build/t=
mp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2=
/arm_tzc400.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fv=
p_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_fconf=
_io.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-p=
oky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl_common.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/tf_log.o /home/pokybuild/yoc=
to-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwar=
e-a/2.7.0-r0/build/fvp/debug/bl2/multi_console.o /home/pokybuild/yocto-work=
er/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7=
.0-r0/build/fvp/debug/bl2/plat_bl_common.o /home/pokybuild/yocto-worker/met=
a-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/=
build/fvp/debug/bl2/plat_log_common.o /home/pokybuild/yocto-worker/meta-arm=
/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build=
/fvp/debug/bl2/plat_common.o /home/pokybuild/yocto-worker/meta-arm/build/bu=
ild/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debu=
g/bl2/popcountdi2.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/w=
ork/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/pop=
countsi2.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_b=
ase-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/backtrace.o =
/home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-li=
nux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_common.o /home/poky=
build/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/truste=
d-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_common.o /home/pokybuild/yoct=
o-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware=
-a/2.7.0-r0/build/fvp/debug/bl2/arm_console.o /home/pokybuild/yocto-worker/=
meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-=
r0/build/fvp/debug/bl2/xlat_tables_arch.o /home/pokybuild/yocto-worker/meta=
-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/b=
uild/fvp/debug/bl2/xlat_tables_context.o /home/pokybuild/yocto-worker/meta-=
arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/bu=
ild/fvp/debug/bl2/xlat_tables_core.o /home/pokybuild/yocto-worker/meta-arm/=
build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/=
fvp/debug/bl2/xlat_tables_utils.o /home/pokybuild/yocto-worker/meta-arm/bui=
ld/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp=
/debug/bl2/bl2_entrypoint.o /home/pokybuild/yocto-worker/meta-arm/build/bui=
ld/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug=
/bl2/early_exceptions.o /home/pokybuild/yocto-worker/meta-arm/build/build/t=
mp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2=
/spinlock.o /home/pokybuild/yocto-worker/meta-
arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/bu=
ild/fvp/debug/bl2/semihosting_call.o /home/pokybuild/yocto-worker/meta-arm/=
build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/=
fvp/debug/bl2/platform_up_stack.o /home/pokybuild/yocto-worker/meta-arm/bui=
ld/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp=
/debug/bl2/debug.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/wo=
rk/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/cach=
e_helpers.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_=
base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/misc_helper=
s.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-pok=
y-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/platform_helpers.o =
/home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-li=
nux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/pl011_console.o /home/p=
okybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tru=
sted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/board_arm_helpers.o /home/poky=
build/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/truste=
d-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_helpers.o /home/pokybuild/yoc=
to-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwar=
e-a/2.7.0-r0/build/fvp/debug/bl2/enable_mmu.o -L/home/pokybuild/yocto-worke=
r/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.=
0-r0/build/fvp/debug/lib  -lfdt -lc
| aarch64-poky-linux-ld: warning: /home/pokybuild/yocto-worker/meta-arm/bui=
ld/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp=
/debug/bl2/bl2.elf has a LOAD segment with RWX permissions
| make: *** [Makefile:1290: /home/pokybuild/yocto-worker/meta-arm/build/bui=
ld/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug=
/bl2/bl2.elf] Error 1


https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2832/ste=
ps/13/logs/stdio

This is not yet in master.

--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--_000_PA4PR08MB7411AEB0965D48E535B6F76CE86A9PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Thanks for the headsup.&nbsp; The relevant upstreams are aware of t=
his so we=92ll pull their fix in as soon as it=92s ready.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Alexandre Belloni &=
lt;alexandre.belloni@bootlin.com&gt;<br>
<b>Date: </b>Wednesday, 17 August 2022 at 16:24<br>
<b>To: </b>Ross Burton &lt;Ross.Burton@arm.com&gt;, Jon Mason &lt;Jon.Mason=
@arm.com&gt;<br>
<b>Cc: </b>meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;, swat@lists.yoctoproject.org &lt;swat@lists.yoctoproject.org&gt;<br=
>
<b>Subject: </b>binutils upgrade will break tf-a<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hello,<br>
<br>
The upgrade to binutils 2.39 seems to cause the faollowing build<br>
failure:<br>
<br>
| aarch64-poky-linux-ld -o /home/pokybuild/yocto-worker/meta-arm/build/buil=
d/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/=
bl2/bl2.elf --fatal-warnings -O1 --gc-sections&nbsp;&nbsp;&nbsp; -Map=3D/ho=
me/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux=
/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl2.map
 --script /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_ba=
se-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl2.ld /home/=
pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tr=
usted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/build_message.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl2_arch_setup.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl2_image_load_v2.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl2_main.o /home/pokyb=
uild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted=
-firmware-a/2.7.0-r0/build/fvp/debug/bl2/desc_image_load.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fdt_wrappers.o /home/p=
okybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tru=
sted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/tf_crc32.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/uuid.o /home/pokybuild=
/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-fir=
mware-a/2.7.0-r0/build/fvp/debug/bl2/sp805.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/tzc400.o /home/pokybui=
ld/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-f=
irmware-a/2.7.0-r0/build/fvp/debug/bl2/v2m_flash.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/delay_timer.o /home/po=
kybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trus=
ted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/generic_delay_timer.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/io_fip.o /home/pokybui=
ld/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-f=
irmware-a/2.7.0-r0/build/fvp/debug/bl2/io_memmap.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/io_semihosting.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/io_storage.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fconf.o /home/pokybuil=
d/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-fi=
rmware-a/2.7.0-r0/build/fvp/debug/bl2/fconf_dyn_cfg_getter.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/semihosting.o /home/po=
kybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trus=
ted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/mem_region.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_bl2_setup.o /home/=
pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tr=
usted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_err.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_io_storage.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_security.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firm<br>
ware-a/2.7.0-r0/build/fvp/debug/bl2/arm_bl2_mem_params_desc.o /home/pokybui=
ld/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-f=
irmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_bl2_setup.o /home/pokybuild/yoct=
o-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware=
-a/2.7.0-r0/build/fvp/debug/bl2/arm_dyn_cfg.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_dyn_cfg_helpers.o =
/home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-li=
nux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_err.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_image_load.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_io_storage.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_nor_psci_mem_prote=
ct.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-po=
ky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_tzc400.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_fconf_io.o /home/p=
okybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tru=
sted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl_common.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/tf_log.o /home/pokybui=
ld/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-f=
irmware-a/2.7.0-r0/build/fvp/debug/bl2/multi_console.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/plat_bl_common.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/plat_log_common.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/plat_common.o /home/po=
kybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trus=
ted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/popcountdi2.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/popcountsi2.o /home/po=
kybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trus=
ted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/backtrace.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_common.o /home/pok=
ybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trust=
ed-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_common.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_console.o /home/po=
kybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trus=
ted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/xlat_tables_arch.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/xlat_tables_context.o =
/home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-li=
nux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/xlat_tables_core.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/xlat_tables_utils.o /h=
ome/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linu=
x/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl2_entrypoint.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/early_exceptions.o /ho=
me/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux=
/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/spinlock.o
 /home/pokybuild/yocto-worker/meta-<br>
arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/bu=
ild/fvp/debug/bl2/semihosting_call.o /home/pokybuild/yocto-worker/meta-arm/=
build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/=
fvp/debug/bl2/platform_up_stack.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/debug.o /home/pokybuil=
d/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-fi=
rmware-a/2.7.0-r0/build/fvp/debug/bl2/cache_helpers.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/misc_helpers.o /home/p=
okybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tru=
sted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/platform_helpers.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/pl011_console.o /home/=
pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tr=
usted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/board_arm_helpers.o
 /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-l=
inux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_helpers.o /home/po=
kybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trus=
ted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/enable_mmu.o
 -L/home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky=
-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/lib&nbsp; -lfdt -lc<br>
| aarch64-poky-linux-ld: warning: /home/pokybuild/yocto-worker/meta-arm/bui=
ld/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp=
/debug/bl2/bl2.elf has a LOAD segment with RWX permissions<br>
| make: *** [Makefile:1290: /home/pokybuild/yocto-worker/meta-arm/build/bui=
ld/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug=
/bl2/bl2.elf] Error 1<br>
<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/113/buil=
ds/2832/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#=
/builders/113/builds/2832/steps/13/logs/stdio</a><br>
<br>
This is not yet in master.<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><o:p></o:p></span></=
p>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB7411AEB0965D48E535B6F76CE86A9PA4PR08MB7411eurp_--

