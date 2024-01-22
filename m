Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0309DC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:25:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web11.75238.1705933548155031263
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 06:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QSpUFN6T;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QSpUFN6T;
 spf=pass (domain: arm.com, ip: 40.107.8.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oF28dmuSjLyi3w+uiHdvL4FGGSEsG18f2YXEc18L4GU/D14froNICawW0EzM0VYnizrAC+2xD1Ia7F8Az7ALi5pCToWYE5AsM7T4g3mZsnh0cV0LmBjJ+dIElQTb1xM/n0ILl2BisGxGgFQ3M5tNi5pWFrb6P4uv+p71SG7/8t+7W1DzxlY0ZpfitVI0IpDj3t8HJu3nani5F9lmhAkB6WUq1qaorHseLyTRSt3Ff+SQRxeQJLftjPVgcEaDIx+r3lxbg8CdPObcdTttDAIJbX5DkpHdIh60WAlzkOyMoUsfu27yWSW4myG7ewBv1F6CQWIoxOGnpnrKqGfjyCFRBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h78FLcwL0rsPgUWBEFzRREkynWO18dywmTHPeVAuMQ=;
 b=MKq1LWPJPNK0Q4yQPQCZeU9h8h0afjBt3VM1+3j6SbRHVVg7H4/+LNyzMsQUmeWLY6f8r9TKwPPLa59DPybKramuS+ukEVtwllNLj5ByOfo39wtjbjEjsBTR8y8YwawbUvTYYr5AfKciCNVd1oFD1Q/V55iepITJ2BtSU4R2J1LxHL5kfIhTLIYkBvKzL+ZXBmLQ5ijq73b5BYv1nPp1m463PhZJuBaLTU/pEgWW1DBnYvpg32Vqa7zsqcCiHCgVo+ApdCkei2fuyz/WXzkKZ5h8yu84j8Hmg3f+uq5rp+rUiTV4uFNyS1wKIfrm+YL4iT+bPzk7L/JS32hz0Qqmbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h78FLcwL0rsPgUWBEFzRREkynWO18dywmTHPeVAuMQ=;
 b=QSpUFN6TZXwvRk0nk53E2mGfXzb4B0+7lB14SeO36+gVxZlEVQ1vukyMu9+6h3VFx8bIWjn7k20e8VFFDaliC2NKr8H2IT0SgX2kJjum6aIflwKtniXArKphxsW2nvf5Z2H2OokKFxfPX35eNrA30FHrTqIaXHIEFipHsmfzIyk=
Received: from AM0P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::34)
 by DU0PR08MB9225.eurprd08.prod.outlook.com (2603:10a6:10:418::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 14:25:44 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::8d) by AM0P190CA0024.outlook.office365.com
 (2603:10a6:208:190::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31 via Frontend
 Transport; Mon, 22 Jan 2024 14:25:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 14:25:43 +0000
Received: ("Tessian outbound 1076c872ecc6:v228"); Mon, 22 Jan 2024 14:25:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b46724469288538a
X-CR-MTA-TID: 64aa7808
Received: from 397674fe3917.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D48E8DF8-4C08-4E99-A21A-4C7B91252C6C.1;
	Mon, 22 Jan 2024 14:25:36 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 397674fe3917.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jan 2024 14:25:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHmgzc7Zvl+Nryf0uVG+YJce4D1FtSzE1U6ehzyx6PXd1HMEIHACSfRVVqkxuwcwlMOX+f5HYQCCVHIi8qWYHymSqOAhpPwnGHkTCVeUp2+WRDdX2yFwDxNdL+3O3AZIJv0aUln8OBfffqv+D0vZwwpuh0Jo+fJldTCrToQKzZxby5apRqmkQcsYBG87v41nk3vB3ZF5iH3F+o5flawQ+JQTBxmiTBEbuSpbaDbG08xKng5ymkE9TY4JSHFI0syZ2h3jdEKGC6r6co7pttu9XlfGQSig0f+WXD72q72++1dJhZpvyGBrKS49fUGPE5YKMFO81E297HHMetos+TbEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h78FLcwL0rsPgUWBEFzRREkynWO18dywmTHPeVAuMQ=;
 b=TyHkqiRcdqiwG1s5LfmDTPaoOX9wNOKnkVTzpi4MAPnxe1Wj6N/JlhfiiefTlXurSgEcHGZYtqCg0M0eGX+M6fNnFQmACpPwVDlBQ1Vjr0O8y6JC7wYxr32rts1IwnUiqPBqaO7K7GZ263ImsLgm4D/2wHhv6ya3soE2Cp8Q/EOHji5oAPz80X2o8b4w81KAVsY5z/cfS5auMlkCoeMdoeMDRDapknq6jSBXS664s1yrvfzWdN1hEClsqdFlrIsrDZUXM8Ez3If3K4rYTvihFZF7ucuJgqP78R/VZnDhYK4bV8Ee4dq4LXEHR8WEDfYlBzXywyme7nWxEpi8MyU0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h78FLcwL0rsPgUWBEFzRREkynWO18dywmTHPeVAuMQ=;
 b=QSpUFN6TZXwvRk0nk53E2mGfXzb4B0+7lB14SeO36+gVxZlEVQ1vukyMu9+6h3VFx8bIWjn7k20e8VFFDaliC2NKr8H2IT0SgX2kJjum6aIflwKtniXArKphxsW2nvf5Z2H2OokKFxfPX35eNrA30FHrTqIaXHIEFipHsmfzIyk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9874.eurprd08.prod.outlook.com (2603:10a6:10:422::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Mon, 22 Jan
 2024 14:25:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 14:25:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Michael Lynch <mlynch@hi-techniques.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] optee failing to build on head of dunfell branch for
 j7-evm
Thread-Topic: [meta-arm] optee failing to build on head of dunfell branch for
 j7-evm
Thread-Index: AQHaTSGBdC01fOkxHUi+8zec0r2QmLDlsTCAgAAnmQCAAAWsAIAAAS2AgAADygA=
Date: Mon, 22 Jan 2024 14:25:34 +0000
Message-ID: <2EB56308-5017-42DE-B55F-92AF772AE1E2@arm.com>
References: <UuhE.1705687266596590169.nYL6@lists.yoctoproject.org>
 <EF84BE17-CEE6-45A8-9FCC-0CDD4BB6F111@arm.com>
 <CADSA=uHnkpYGXfiK-u5NkHgqLutFh=Fy75Uurv4Zw7HcAMqCcg@mail.gmail.com>
 <797DCC01-1255-43F0-9596-85E7F173A6F0@arm.com>
 <CADSA=uFgpA6E=m2XvGuu-oSG+_BcXbGz04=Hf2bpN0vVN4=SgQ@mail.gmail.com>
In-Reply-To: 
 <CADSA=uFgpA6E=m2XvGuu-oSG+_BcXbGz04=Hf2bpN0vVN4=SgQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9874:EE_|AM4PEPF00027A66:EE_|DU0PR08MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ebac17-78e4-4f45-2e80-08dc1b5604b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fTuMcrcQru8UOMRvDs9lElWmYFeE1NHD3Rfcqme9B0tH3gtfiELpGysu3ZCDJfRbtgNdLfH6VU3x+cN4Q1tSjrU8nXwvEPQYk8IQ3A+GX08gWvRdfS2a/e8htDJDcV0Nb4DShHdjC7L5FeZEJJ+GqhiD8x+LqET9ZCVWdSabVcDosgsX1bbhM8iY+YmjVet/bszAWuDrxW5zm9xLdOGrA48UMfFdVKZvz5Du5XQze5hzocGgYoP323XC2zgammXZaTmm5AQEhSHVvZSESRqfL1mzw6e+RbkXCB2KJ/XVYaaZJQOEbKiNXJzI0R3fme5DWL1fVz60pM63OrrPOCtVcUAY/7j9KOv0DoA0mjBX3B9h85K/mkquenu3feNLsUqWdufgaoNk73TSAp0AnUddL/D28vmh/LWEbzZE9GC+bUKEWDYhyBoeGhbeZartPd09pa3RD46daNk1Z5hJeZ01gHUy3T/UGHjkYr/GqXzymYazkUm+6x28nLIEOpRzsFPtHpvBWHpH5PUzCaI+HpFQcEqzXGxuLBMCY7wMUCt85VEjn3h4ezqeNI+GszSFdeHFZ6DP28vOEo49LiPDwXZ/hXMCaJWHlgkHZNlM2oBNsKa7RGwgT6b8UVAH1JdnY8Q769+2b/EMExGVeeI0f2LYkw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(2906002)(26005)(64756008)(66476007)(66946007)(76116006)(6916009)(4744005)(71200400001)(8676002)(8936002)(316002)(91956017)(66556008)(6512007)(6486002)(4326008)(478600001)(5660300002)(6506007)(2616005)(53546011)(122000001)(83380400001)(38100700002)(36756003)(66446008)(41300700001)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <895CFF210333BA4C9360FAEFEFABE62E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9874
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f7ddecff-c4b0-4564-7bbc-08dc1b55fefb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Uneh63St32Qq3y6pFXsWAcZiaQ5RPeD3FWw4BA7CtssQibNhGrMNXwnfOkfYIcyYjjnRBjI2w023WERYOVjYWoxn6FguX5WJYXFai+5PiNTsqC2Og/kK06KMdRIOPcfO/1/k4sVfi41tDMUq7oTObCSyaJK57IG5GA80yeYPlcT9vnb7caT8T20eVoLeXI3RwTA3CQCyJoFhFg01nfQlGty2aBsuJ2ILS/Q54/PXCuUz52z+DeDFIK1kYPZRkpyQbbyNYV3ehlh2CGUjj4CS1en4un4qwm+VN78QLjHlbb/xseZANc1NdGen8/N9BRSZtKOFIDn71P2Yvv/+L7wJMSZcrI4eX+DUzXZmohiVwjPZhv+hNAtg+dWAr5vTCDGAf0e+o5+RIEOLYoUg2Hqdp8fKNZ3CtEe2s6ULa1ykGbzNuzPIu6zJq9qKO2kcJ2hQJUP2fpwCw4V433z/eUwXXlegWLwRZGk1j/A0jO9xrx8jH11t9blPkhv6jPZS4XZZuWLqfyRMNTr9LtZMNqCow2rCZG+94T1EV37+Ez6ABotdEBQ+Ros95xdcHK/RhZcQL2dIdkQmVVm87u8j9E0cvrgA46QKMfhDaWBodprwHQyM4ZJ6qiAEcObu/Cqxgv8ltsPz/cuewvq6evKYmwxBY63mNffi+6M1t3+MNydtMddc1rrToDym6YsHILqbGM08Em6Y+IIsHATMlV7eXF2SALhxnH/rzDjxXJfccQIahsc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(82310400011)(64100799003)(186009)(1800799012)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(41300700001)(36756003)(86362001)(33656002)(47076005)(6512007)(36860700001)(83380400001)(2616005)(53546011)(26005)(336012)(316002)(478600001)(6506007)(2906002)(6486002)(82740400003)(356005)(70586007)(70206006)(4326008)(6862004)(8676002)(4744005)(5660300002)(81166007)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 14:25:43.9288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ebac17-78e4-4f45-2e80-08dc1b5604b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9225
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Jan 2024 14:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5351

T24gMjIgSmFuIDIwMjQsIGF0IDE0OjExLCBNaWNoYWVsIEx5bmNoIDxtbHluY2hAaGktdGVjaG5p
cXVlcy5jb20+IHdyb3RlOg0KPiANCj4gTWV0YS10aSBicmFuY2ggaXMgaGVhZCBvZiBkdW5mZWxs
Lg0KPiANCj4gT2sgSSBiZWxpZXZlIHNlZSB3aGF0J3MgZ29pbmcgb24uICBUaGUgZHVuZmVsbCBi
cmFuY2ggb2YgdGhlIG1ldGEtdGkgbGF5ZXIgYXBwZW5kcyBvcHRlZV9vcyBzdWNoIHRoYXQgaXQg
dXBkYXRlcyBvcHRlZV9vcyB0byB0aGUgMy4yMC4wIGdpdCB2ZXJzaW9uIGJ1dCBkb2VzIE5PVCBz
dXBwbHkgYSByZXBsYWNlbWVudCBwYXRjaCBmaWxlIHRoYXQgd29ya3Mgd2l0aCB0aGUgIm1rL2dj
Yy5tayIgZmlsZSB0aGF0IGNvbWVzIHdpdGggMy4yMC4wIG5vciBkb2VzIFRJJ3Mgb3B0ZWVfb3Mg
YXBwZW5kIG92ZXJyaWRlIGRvX3BhdGNoIGFuZCBJIGJlbGlldmUgdGhpcyBpcyB3aHkgdGhlIGJ1
aWxkIGVuZHMgdXAgZmFpbGluZz8gIE1heWJlIHRpbWUgdG8gYXNrIG9uIHRoZSBtZXRhLXRpIGZv
cnVtPw0KDQpBYnNvbHV0ZWx5LiAgVGhleSBkb27igJl0IGFwcGVhciB0byBiZSB0ZXN0aW5nIHRo
YXQgY29tYmluYXRpb24uDQoNClJvc3M=

