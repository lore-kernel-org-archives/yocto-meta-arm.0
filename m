Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94C6C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 22:07:19 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.56])
 by mx.groups.io with SMTP id smtpd.web10.55824.1677017231463782771
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 14:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IKWNM7kT;
 spf=pass (domain: arm.com, ip: 40.107.105.56, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6wVTROIMqj979ITcy/xLDs2XjIg6gMWPRmbv+OjoJI=;
 b=IKWNM7kTgXiE0VhDdmwQ4SHQ90hM3h3G1a/q21M6GlG9f5E2oWKfdPCxb5pMheoqMElIFaAShWjOT1QO2fC6mxa962PpjvWPlw/i/j9FdlqzDcJulM6V6KNFywoOUSkzh54gNjrhpzSH+p8LGraFdX4n55LfuP3ScNC02e3Rr/w=
Received: from DB6P193CA0001.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::11) by
 DB9PR08MB6380.eurprd08.prod.outlook.com (2603:10a6:10:256::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.21; Tue, 21 Feb 2023 22:07:07 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::80) by DB6P193CA0001.outlook.office365.com
 (2603:10a6:6:29::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Tue, 21 Feb 2023 22:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.17 via Frontend Transport; Tue, 21 Feb 2023 22:07:07 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Tue, 21 Feb 2023 22:07:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a2f6b2e0b2168e0a
X-CR-MTA-TID: 64aa7808
Received: from 3edd325987b5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F5959E81-53BC-4A65-8C01-B468786E843A.1;
	Tue, 21 Feb 2023 22:07:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3edd325987b5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Feb 2023 22:07:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmlMzO1avxHfL+le79GbGgFwbR0aKi1hloSqR75n5AHLsY0B+f+T4hWMDfbU3u798rqLZqch2Q1WifezVzQsHEgmGwfhyHA/s2RJG0H1+IrUBVZULbu3a7QGOw4DN1nhYfzFnwqh3Ry1x7tAU59iHBeXrzBwmgA5sbVdUp5Zr1yUWzdFbGSRUGWj99Dtc0qcbTaZQNVvuDvSunM1RVVDZp0zNTxNV/91Y0TN6IcLU9pNdFgdSfGywjLJBU+7juw4hegveR4r9l70a3M2Ys0yFdidFyiMw4ZdU3JkE80D0mTzk0clr9ScoNdtt91ls7gJA/Dfdb9Y4XetXXR53r1pQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6wVTROIMqj979ITcy/xLDs2XjIg6gMWPRmbv+OjoJI=;
 b=dVQItkmfikYbw4+AVAGb74941pg1El3aV1ljUHuHAa0ybvPAdV3kpkjM+RzIREGOfsOp+tdE2izNicB8H9LDreTTY8b8jgi7aqettGBf8HEqJ2Fs2IG+4fGkebFkQCno6Q6c8vvxNGT5FYoVj5P1XGBttm4CIPm6H1zt9kmTPLfWNcSQ9wmzMCj6uZq4nrYIkQARUUCV14He23AaXQojQQCShBeZGYZMzDot3V2iTuLpvxjsGWDlcOwHvZ09ELQu7z959meEPjka4ZFSo2prcy4JgyjWD/UPRddSO6AWlEnnUVf/1PJFqAzB3EdLgjZKo6O+xN1DHTNS3duAmXzsvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6wVTROIMqj979ITcy/xLDs2XjIg6gMWPRmbv+OjoJI=;
 b=IKWNM7kTgXiE0VhDdmwQ4SHQ90hM3h3G1a/q21M6GlG9f5E2oWKfdPCxb5pMheoqMElIFaAShWjOT1QO2fC6mxa962PpjvWPlw/i/j9FdlqzDcJulM6V6KNFywoOUSkzh54gNjrhpzSH+p8LGraFdX4n55LfuP3ScNC02e3Rr/w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9153.eurprd08.prod.outlook.com (2603:10a6:10:414::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 22:06:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6111.019; Tue, 21 Feb 2023
 22:06:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peron.clem@gmail.com" <peron.clem@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] gator-daemon: bump to 8.3.0
Thread-Topic: [meta-arm] [PATCH] gator-daemon: bump to 8.3.0
Thread-Index: AQHZRd7rzcyRuHdeZECu4t9LZO1jCa7Z9dcA
Date: Tue, 21 Feb 2023 22:06:58 +0000
Message-ID: <210CE50C-AEF1-45A8-AD65-CBA78F406959@arm.com>
References: <20230221102509.6601-1-peron.clem@gmail.com>
In-Reply-To: <20230221102509.6601-1-peron.clem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9153:EE_|DBAEUR03FT012:EE_|DB9PR08MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebcfc04-2239-4f85-8d12-08db1457f903
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VRaJ5VySW4M/edrP7IRqvOwrq1y/SIfPS2yTRvP7eRizexMc4w6tONLD9lYml6N9YsUrCMpLhAPBMceMbtjwXtocKX2FnejvMu5Oa5GpBEDkwGOkm4DPDUeenOL8HqpAhcZHeloKbL+NQyrXj726yYdBXG2vLcx1R8kCIXx7nuVj2lra8NBh3cydpQTZ2OiHIc/uHNf0h8tejDK8eVZRrOOA3+vmu8npPVzU5Ln6Ageqt9+kWIYa2MRTrSXZU7f0pkIFHSILg/c94BFqL/1dEaL1ZGb6/AILnpM2oo9QH0XNrn0vsjZUAo8fmaWDLjMqoyGnWJHBr8m6Fd9he4dLoG9eaYb5IBfjBIbQMx56nZmTo20V3XcTplF/4w2MFt6dj7JqL2vw96Wa8K7eI6VeZqytu8eJKPtvv8uZZMY66sQJQEbgWV1+LUJwqzgmszwUCrZMPMCSd+FMzCT3AEkxiC82nGMJ3delkcrUpvpTInmr9MHDZlB79s+vFRQcmJ3YTpXDdRjavrqxbh81H+R/KSPkl8LpmUl33G43UAk1PNExu/Hb/p0xGimZq/B1XSHY0JreuYH+kdborH7HbtO4pTcM5yvf61pKM4vEgIxVQwByRBVIc531X9Vsht3P5iVADj24Iz3Tl9CJvWMysRYsJ7ik2bbsc0W1ZNFypFyWgRhkMrY7JcYoz5nNulXkbQpSsnuN/NSmtwkogTBzNwxXQx4dc6f3xoltyYGPRx1riYI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199018)(38100700002)(83380400001)(122000001)(38070700005)(33656002)(86362001)(36756003)(2906002)(8936002)(5660300002)(41300700001)(186003)(6512007)(53546011)(26005)(66574015)(2616005)(91956017)(6506007)(4326008)(316002)(66556008)(76116006)(478600001)(71200400001)(6486002)(66946007)(6916009)(64756008)(8676002)(66476007)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFC7AED4884B4C4E856CC3E49466034E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9153
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e3994f62-8512-4a2d-3595-08db1457f3e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KkAiijT8i1AumckdXzaqrgMA3J+AANv3pQgEBUM3J0YoqvlHqjaY4uKIsNNvl52fx9Nycdu34f37juistA8bwJ8I8LbYoQLYt7E1KgYZV7JnfDbPN9BCv1pEWghviV+69tUB0SLuuDPxcdQ8MyjCigDlNVA/yC1lKo9gPKGjeiCrKNt9h6tE3PKhhOjN9KGDFT4PBTxMbxJ/HmJ4l61fAXYZAhvC1LP7D6PIgkCMZUS/99CbuBSX2oTbdjggfWh9O5ZW6iaYpYbRpX/oYMoAVd6/4Sf0upYnXyq66wwPUfu2rZPGmTXp49jtqQBvpe66AYf9LF03STKEBpx5eh/9l/+gW1dTT1mcFkIfbWp+gyKrfCJQyzHokJoEKkNW7e8BXYSpVpmWa0tZm6sqw9bEf77wWDmFL4C0GdvX1IRr09/YXDGc28oH8wv76x0/QV91GfkLCj4PwONN10QazWf93CmCV7V2NiPNUhUvQDY0k5aa3qKtw4SGY8fLKArCMcxVTxRX+IBrflpL0OszTxwPHyzfRHrnTkpPjjcLeVJHvwicOEQlkiuQ6Udy5SrZ6et5l0aF5CKbWTEqPSth/dJOgZZIqK6qnCjoI4QUKi/fus129HVVfKyTR8uLfJhvU+ygpU4F09oy1eCdgIqBkcVeWUw0Clch1Efl09Y0kneAWy1GXhDqrLKZqB841Flr4VYStajArC+xiF952sberXZSpw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(41300700001)(83380400001)(33656002)(82310400005)(186003)(6512007)(26005)(53546011)(316002)(6506007)(40460700003)(86362001)(40480700001)(6486002)(478600001)(336012)(36756003)(356005)(8676002)(2616005)(70586007)(66574015)(4326008)(70206006)(47076005)(36860700001)(2906002)(82740400003)(81166007)(6862004)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 22:07:07.5526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebcfc04-2239-4f85-8d12-08db1457f903
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6380
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 22:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4436

T24gMjEgRmViIDIwMjMsIGF0IDEwOjI1LCBDbMOpbWVudCBQw6lyb24gdmlhIGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcgPHBlcm9uLmNsZW09Z21haWwuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
IHdyb3RlOg0KPiArKysgYi9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL2dhdG9yLWRhZW1vbi9m
aWxlcy8wMDAxLWRhZW1vbi1hZ2VudHMtcGVyZi1maXgtbm8tbWF0Y2hpbmctZnVuY3Rpb24tZm9y
LWNhbGwucGF0Y2gNCj4gQEAgLTAsMCArMSwyNyBAQA0KPiArRnJvbSAyOGY5M2M4ZmFjNGIzNTY1
ZGI3NTcwMTBkZTAxOTc0Y2FmZjc0YzhkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiArRnJv
bTogPT9VVEYtOD9xP0NsPUMzPUE5bWVudD0yMFA9QzM9QTlyb24/PSA8Y3BlQG91dHNpZ2h0LnRl
Y2g+DQo+ICtEYXRlOiBUdWUsIDcgRmViIDIwMjMgMTM6MDM6MjkgKzAxMDANCj4gK1N1YmplY3Q6
IFtQQVRDSF0gZml4DQoNClRoaXMgcGF0Y2ggbmVlZHMgYSBiZXR0ZXIgZXhwbGFuYXRpb24gdGhh
biDigJxmaXjigJ0sIHlvdXIgU2lnbmVkLW9mZi1ieSBhbmQgYW4gVXBzdHJlYW0tU3RhdHVzIChp
cyBpdCBhIGJhY2twb3J0PyBTaG91bGQgaXQgYmUgc2VuZCB1cHN0cmVhbT8pLg0KDQo+IC1MSUNF
TlNFID0gIkdQTC0yLjAtb25seSAmIExHUEwtMi4xLW9yLWxhdGVyICYgQXBhY2hlLTIuMCINCj4g
K0xJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQTC0yLjEtb3ItbGF0ZXIiDQoNCkxpY2Vuc2Ug
Y2hhbmdlcyBzaG91bGQgYmUganVzdGlmaWVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KSeKA
mW0gZ3Vlc3NpbmcgdGhpcyBpcyBhcyBteG1sIGlzIG5vdyBhIGRlcGVuZGVuY3kgYW5kIG5vdCBp
bnRlZ3JhdGVkLCBidXQgSeKAmW0gZ3Vlc3NpbmcuDQoNCj4gK0ZJTEVTXyR7UE59ID0gIi91c3Iv
YmluL2RhZW1vbiINCg0KRklMRVNfJHtQTn0gaXMgb2xkIG92ZXJyaWRlIHN5bnRheCBzbyB0aGlz
IHdvbuKAmXQgd29yayBhbmQgc2hvdWxkIGluIGZhY3QgcHJvZHVjZSB3YXJuaW5ncyBhdCBidWls
ZCB0aW1lLg0KDQpZb3UgbWVhbiBGSUxFUzoke1BOfSwgYnV0ICR7YmluZGlyfSBpcyBhbHJlYWR5
IGluIHRoZSBkZWZhdWx0IHZhbHVlIGZvciBGSUxFUzoke1BOfSBzbyB0aGlzIGlzbuKAmXQgbmVl
ZGVkLg0KDQpSb3Nz

