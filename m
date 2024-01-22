Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC30DC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:08:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web10.74537.1705932476157806836
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 06:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=d8VepRIg;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=d8VepRIg;
 spf=pass (domain: arm.com, ip: 40.107.7.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IJmqugaRnRWnGSXU2JBBin0fwnkL/ulHagJ1sQcaK1Dqca4g0KIltPgsyxDmtExXQW5pB37y7WX9i7Aa7GYstXnDRKLj1HnMtWlnmcguUVvWIqjPcv2E/uqOVZD1QJwRWrgMFcN0rlxFdZozRG0HCyIk3+RfqNBsCj6gO/1UW6EYT8n9Q7Hlfm08ZUufmmabXj3TiEv2x6psv08U3dmOPqA3DgiRFeLuGVX0UEyduhmBq0Rv3PWYJYkhVUnDolledjXvUqAIyaSfNDPgvrgvK5ZZkeg6qbFTNY/W+CHiAgXFbC+4GKZDLH3sHuv28s/GbwVKzyjyRii/u9ZS27WKpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LT5EhXNIxBFEsW3Ewh+mcNzAzpqSV+yHIb/kNsVBdc=;
 b=UsmdRoZ16yPhzqHTk7dA9zUE3EeUZAsgCyU309FDZICb1GurWcJlUJv7IlVUzYJUqPE8T/zZa4ia/b8vJQNDzoNJDwzKBl57ilitplKzQXuU/+q/RziBpQhtmK8Vn5vR16u9QDnuMV6FJmEsZ/Cw/l4aUP7fA3mm2p7T/1eOMyWY7ASKasYd51MRmahnKpWCisbh8Esp1Vb4jyKjXIjKju9H1WDgn11YjYk4EriDL2NdpPUcbiiy0GDe/cDqu5q8jpqzJ7GMlaVYmcsx+s5CHyhHVhZaFqmjy/kSSSfxExsmooUiPt6/AL2xysPZ/dZlavSKtdxW9lerp1TZSLqpRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LT5EhXNIxBFEsW3Ewh+mcNzAzpqSV+yHIb/kNsVBdc=;
 b=d8VepRIgOfDhhM9rGJZdkHHiknkPgtE7pC6urwfwY5gBk+AJxBy6/NVnPpfcHuvMdMkKkp1fcKOMz5Hs+G5hZpqz8OgoBBZTpsHwrO9fH6NhNUBMLNajceVa+ur/f61gGCyZbOi3nlTY9hxit1JL0r6mTqaAzVcwLmqnZYcCKjM=
Received: from DB8PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:10:100::43)
 by DU2PR08MB7342.eurprd08.prod.outlook.com (2603:10a6:10:2f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Mon, 22 Jan
 2024 14:07:52 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::79) by DB8PR06CA0030.outlook.office365.com
 (2603:10a6:10:100::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 14:07:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 14:07:52 +0000
Received: ("Tessian outbound 67699c3f02bc:v228"); Mon, 22 Jan 2024 14:07:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b8001b90c456874
X-CR-MTA-TID: 64aa7808
Received: from fea6e9e08fc5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2F2394CE-0495-4138-92A9-7A8E5B11557A.1;
	Mon, 22 Jan 2024 14:07:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fea6e9e08fc5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jan 2024 14:07:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3JJFQmAPKS1sTSiO8RGWnfgaadhKBkF3GhbbSyEBQvFJY3XOZfAAWnsTK1OmLtH9nK8ynYYADfshHxmhwzkKXT3lB+yrVTUJHrETHiOo0LDnIS7TGJzPubqXeQ5qGK6FDW/sHXUwZO9tVV7YlHd0EmZoL+wKf2VZQcSlL7AyFJT2I/lkjWw2qxnTn4StwgyKwFeXAwKfLZohLC6s1/DcnDBtDD05iDlNPJ33g98MO48+Hy2YHgAPyCMlAvsNTM0qNEeZIa/4fB4mWRiBZBoYvI/3ZtJujHXzgXaME9Od/BuNfzD+pGMkCbhrYDhBfSQ/KCvs5ZBeq19cVWGbyiy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LT5EhXNIxBFEsW3Ewh+mcNzAzpqSV+yHIb/kNsVBdc=;
 b=dSgDJ/HX23ooQNX7BGg71OZHuAu9RMQ2ldsk8IZSzYaE1IHQy5agCsUcUeIPTlilaFvFdMHy2NLrWzCQJ39s0SVg3RWlhe0cDR9o0vaQcTrGkaRPKSX8QwD3jxk8aN8SGBI5/wJ0oZIb5f3r6dXmGq0+wU0C5plykJz3X8maJkDM0byHBn2uJoidm6jpVrza6HcJe8spFNbEFe22XqMdTQRC9+mBtsEM3DJ3xuO2Qx1LQ8h+ev+6eMX+bQL/7AbZen3UVIEpXY8n4GA4mu89TqV9RkSuQNmsMUkU50w8YQAjaJWJ/kJ/6IJaS46DUsGamfsPxaih/66Kj+SuNP2rJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LT5EhXNIxBFEsW3Ewh+mcNzAzpqSV+yHIb/kNsVBdc=;
 b=d8VepRIgOfDhhM9rGJZdkHHiknkPgtE7pC6urwfwY5gBk+AJxBy6/NVnPpfcHuvMdMkKkp1fcKOMz5Hs+G5hZpqz8OgoBBZTpsHwrO9fH6NhNUBMLNajceVa+ur/f61gGCyZbOi3nlTY9hxit1JL0r6mTqaAzVcwLmqnZYcCKjM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5476.eurprd08.prod.outlook.com (2603:10a6:208:18d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 14:07:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 14:07:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Michael Lynch <mlynch@hi-techniques.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] optee failing to build on head of dunfell branch for
 j7-evm
Thread-Topic: [meta-arm] optee failing to build on head of dunfell branch for
 j7-evm
Thread-Index: AQHaTSGBdC01fOkxHUi+8zec0r2QmLDlsTCAgAAnmQCAAAWsAA==
Date: Mon, 22 Jan 2024 14:07:44 +0000
Message-ID: <797DCC01-1255-43F0-9596-85E7F173A6F0@arm.com>
References: <UuhE.1705687266596590169.nYL6@lists.yoctoproject.org>
 <EF84BE17-CEE6-45A8-9FCC-0CDD4BB6F111@arm.com>
 <CADSA=uHnkpYGXfiK-u5NkHgqLutFh=Fy75Uurv4Zw7HcAMqCcg@mail.gmail.com>
In-Reply-To: 
 <CADSA=uHnkpYGXfiK-u5NkHgqLutFh=Fy75Uurv4Zw7HcAMqCcg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5476:EE_|DU6PEPF00009528:EE_|DU2PR08MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5172b2-a93d-4cb2-44da-08dc1b53861b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YnRL5NAIxCN99qb7PI4WrqflDMgHVv0HcCV6DIVYoBzwaWWVxUsU/Yb8D8Vp56+O31E2fqJlyUIkK43yGNkrwA00X8DCOnt1uSaiD8wWTITduAexSEwb0Yb5CRAoAJfZtHLWNolvxyebrujOMlV6U8X+57uU1njjxjGuz5kRAWMhFNCASf1gKWda9KdQYJ3bvuKJ1uOq7jq72Bs6kG8xHx7qgEke9+8eDZc7FHgXw7edbP4HMMyvjtxXtt0GMo1IxVD7qFTkG6TuG1xVD3FaRjswjz8opDAOBAm6jNPa1rDfx4aiBpyp5l2LDbOre2Lcz2/Bt5NgxKYjeczBr4a3icEa+/Zliva+uzu+w/a65r6aEJaXEBlRvPy8JJjgewtQj91YJDGDpjw7EmA8at9GMITVHtw6r91Iiw8VsC9SHtOyOFr+UYJo99BKXhu/h7TMWFcyBagSVf0k3AM/8xJB/IY2m/eQQBA900SJhlOLPedEqcoa8IAZ7o4uejG+Ek0pH1Ertkl3FXAYzA/ZzlYpoNC/oi7pJe1OIQy9l7q7aQtkMl8CP5/tT52Dl2vbj6cCeZBY650IQVlQRx8Xd3Dw9agKjCDHGV50WahUbbOGQgviMEvaX7ThJdCGcOvY1ddFmCPTqqQcoszPoIrrrb9kHA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6506007)(71200400001)(2616005)(6512007)(53546011)(26005)(33656002)(38100700002)(86362001)(122000001)(36756003)(38070700009)(41300700001)(83380400001)(2906002)(5660300002)(6486002)(66446008)(66476007)(4326008)(8676002)(8936002)(64756008)(91956017)(66556008)(76116006)(6916009)(478600001)(66946007)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <752D3A6497C9C140ACD40A702F8FAB15@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5476
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b48b75d4-fa45-4cb0-6936-08dc1b538134
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rKP5wsGPcCxfS/+PEe6+0iORd2uiOZM/Zl7snxxsjqSLUGZiwjy/14qfME8fITcRdWPy0uTJCFca9IJXSchsSW8bR6g5WvoCsbasM/QJH5xIPOM9NP6oVXTLfkFm0TYCvHsqRpY1bTniix+SjynkRptoqEGAQxBqolQleCfrsjQhHwZZp5Puv8MZa7Ch9r65bAzTz+LmpRsY/Q9Bb9rpsfV6yUdjeidgj/aYDOpbjXjyBp5DMt1mDQYuwVYBv4bHXW4NH2fO0+RtG/Lk3v9WbucmIJxyc+kZ+4M3ZDkUAyJtBkwlH3Nf4Hg6a86Xrigs4hqTpmoMI72FjN5P+9pbETYF77LXCyWQkIRQVuegZXzvTZYPCTdkZ1Zz4oc0Oj3drIxMQMURZbmruVFB8HcBT/Wiy4zWPO8T3sxvkw1f41SU6jTQ0VXPXfBLUXq/5IpPseVGRYMIc/U6bt2eSv8tF5VGFyys8Qeh1rACgkgb6anQPNu9spJjbMf93n7TuvmcAPCCDwW1Zkc5cTlCqZinUnVwoifShKhASr928T2dwB+NON5ddhKoL0fMZXynQmBuftQ9novJNzD5GmF4f3ISTItwraj5FxW5v4BC9BRXrBUfuhVkXJNEzePb1ACd4f0VZYjGlKE1Qz8cC9Z69Ax0aq1eon3DyZFNuwLcmnlp78YBX6NXKGJYmK6H7klchvi29x0zm4bHqfX26ReriSJDbQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(346002)(376002)(136003)(396003)(230922051799003)(82310400011)(1800799012)(451199024)(64100799003)(186009)(46966006)(36840700001)(26005)(2616005)(336012)(86362001)(53546011)(36756003)(6512007)(47076005)(83380400001)(2906002)(478600001)(6862004)(41300700001)(5660300002)(70206006)(8936002)(4326008)(70586007)(316002)(8676002)(6486002)(33656002)(81166007)(356005)(82740400003)(36860700001)(6506007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 14:07:52.5937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5172b2-a93d-4cb2-44da-08dc1b53861b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7342
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Jan 2024 14:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5350

[Re-copying the list]

On 22 Jan 2024, at 13:47, Michael Lynch <mlynch@hi-techniques.com> wrote:
>=20
> Ross, thanks for the info.  In all cases I've been working from a fresh d=
irectory tree.  E.G.  Downloading everything (layers and sources) afresh ea=
ch time I tested the build.  My meta-arm version is 3.1.6 (head of dunfell =
branch).  The problem I see is after I attempt the build and it fails, I go=
 to tmp/work/j7_evm-poky-linux/optee-os/3.20.0+gitAUTOINC+8e74d47616-r0/git=
 and check the version and it is 3.20.x.  I expected it to be 3.8.0 or am I=
 wrong?  Since the optee_os source is not the version expected, the patch w=
on't apply.  It's acting like the SRCREV from the optee recipe isn't being =
applied when the source is cloned from the GIT repository.  I know TI does =
some odd things in some of their recipes and their layer (meta-ti) does, in=
 fact, append the optee-os recipe.  I'll check that and see if there is any=
thing obvious in it that may explain what is going on.  The nasty thing abo=
ut testing this with meta-ti and the dunfell branch is optee is only used w=
ith the j7-evm (and possibly others) machine but is NOT used with any of th=
e beagleXXX machines.  I'll let you know if I find anything with TI's appen=
d to the optee recipe.

What meta-ti branch are you using?

Ross=

