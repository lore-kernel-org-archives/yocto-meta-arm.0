Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EC6C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:12:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web09.9132.1664273519435417131
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Sep 2022 03:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=58/0kGE1;
 spf=pass (domain: arm.com, ip: 40.107.21.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VCDguJryBP+koHu5ykznyN0J0dBZxt0wSsBp4Kv9aYwk+6c1hT1HdLDoQqT4m2jfwNmpgUWcaAsmUVcNhHLZleQ9SKPHYTeFdHCrhvvDUcxx7XV0LESCGzwPeJh0s6+UnXCUPmPWtFzmq5lToGTebUXxmZANeCJLuLM8LVtcBYf7IVITcoM5VTQTX5K+7ojtSgG+fxEpEt5oKDeKyhJqJyAEArHWEXJIdHRYEScifHfIqhh+uDrnYHyp/rVcytdXDbKykzyPjrpxnQ4hbVH+1Krkm9mk7q5r/EMUGSISexEtlQszFoWqWRYKKYRb0fu8scvc5Y4Vl++t6MKiRUeLJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlDrk7ntnut0B3vxcSLc73tbXlmjkDCDtwJQ+NhlgZY=;
 b=GHxbseJa4+06ngy8U6ElQlKNE8DADatUdq0SMjlCAZnrdWB7vDozHMNCCsy3TvQROscOokbCJOnA/0+sOtixUS8/B3FkSoIS0wZblQ2mQnIoohr8VcaFJUoQ4P6hcvJLHKDE1C8RZ6/QoRXUWNQNfSGDhdcANPEl0EsbVpVpgYXDMwe31Y4yc+9J4iD7qbYHZ2oodA/PCf0AtdfvKpPBq9t8pwyO1Txyx1ByulpotxproZ+QeV3BtKzrcGK1KXyMqzaxVekK2FLvfuAoBSWNRpFfv4ruiYz2bIRMd2EfRiskNPn+2fsVeJmHGc3ln1rRzxaleppgukkKvBkIgrNeRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlDrk7ntnut0B3vxcSLc73tbXlmjkDCDtwJQ+NhlgZY=;
 b=58/0kGE17wWT1CXo8Ga5p52usD76JacJs/0fZGPcE2sFgiQ4nIsipz9RV8dB+YjTMKCGAnUeIA3AMvAiPjAg5YbcIXNU+YZwIsMvy4ZMG1LSofD1uaGkrd4PwxRhHRo8ETWta5+EwifNirqJhOPZsOwyruynbo4nOotdW7nWJuk=
Received: from AM8P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::16)
 by DB9PR08MB7509.eurprd08.prod.outlook.com (2603:10a6:10:300::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Tue, 27 Sep
 2022 10:11:55 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:219:cafe::54) by AM8P190CA0011.outlook.office365.com
 (2603:10a6:20b:219::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 10:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 10:11:54 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128");
 Tue, 27 Sep 2022 10:11:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b463068ce77e9af7
X-CR-MTA-TID: 64aa7808
Received: from 8de58756cdc8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59925FB8-C280-4AAB-8CB6-C70CA4CF0262.1;
	Tue, 27 Sep 2022 10:11:46 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8de58756cdc8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Sep 2022 10:11:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHSwhGwSTKK1hhjlJH4idkkVNLPrWB0fdC26m1q5X3pygmU4KhJYKvUhrvdYz9wPbZMwXiODetV+CjxN9fyV8AJg7L6qkLTipJvmhTl1uqMl/HE9l98zFYnxH2RGJMYQKCi7PbFegawoQ1Q0UAnkP3dcT0ufGJC1uz/I5O2SIbagjNm6FVPv9Io0cSyTNxCflnYAM/QPdLrSy8GwiquUdZfE/zMITWTz+Mhd/74OTH88rdzwCNfHi+I21Lg/3XzgJPazfJnEIYcO4Dx1gFcr3EoJGa6KfJcqCWHox3JBaW09kOBHsZ64DSG3Wo/lUgMDxT+2wI/rmkpSvn21b26YQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlDrk7ntnut0B3vxcSLc73tbXlmjkDCDtwJQ+NhlgZY=;
 b=FipSWIdm861/wS7XrujPZrn8ssnN1RtphSWtRWveV34IaUbiro+vwTIbcJB+J8kcjNh4uGigbWhKof4fZjCdGL3QzD79vAyyTTH5u/Tt8A/WUP611Qhf5rlftgebIclyhTpJbqwX4pu79XROjf2HfgzF0V97SMqGKCMrn/7Pex0vq48wn5h98oEj4uHMBazcx0XF75rWJIQVZevFMCSkVTjfQeDz53qFK31bOF9017zoYzCRUyLD78tILDpIZytnWcdKMJCtoxECjiLQLM7PtAM0ZeqsgxmsnVJVv9gIDl0cafL/6zkGMCmXtg+54CrGER1pksIQbvnvhw6bi/pTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlDrk7ntnut0B3vxcSLc73tbXlmjkDCDtwJQ+NhlgZY=;
 b=58/0kGE17wWT1CXo8Ga5p52usD76JacJs/0fZGPcE2sFgiQ4nIsipz9RV8dB+YjTMKCGAnUeIA3AMvAiPjAg5YbcIXNU+YZwIsMvy4ZMG1LSofD1uaGkrd4PwxRhHRo8ETWta5+EwifNirqJhOPZsOwyruynbo4nOotdW7nWJuk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5417.eurprd08.prod.outlook.com (2603:10a6:10:117::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 10:11:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553%4]) with mapi id 15.20.5654.024; Tue, 27 Sep 2022
 10:11:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] hafnium: Exclude from world builds
Thread-Topic: [meta-arm] [PATCH] hafnium: Exclude from world builds
Thread-Index: AQHY0fcqbO+xoQK2A0SrLlg2+bHyW63zDyeA
Date: Tue, 27 Sep 2022 10:11:44 +0000
Message-ID: <9E83B847-E36F-4EFC-BAA8-E09C273D615F@arm.com>
References: <20220926222642.3105379-1-raj.khem@gmail.com>
In-Reply-To: <20220926222642.3105379-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5417:EE_|VE1EUR03FT013:EE_|DB9PR08MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dfebad-05f4-41fb-2067-08daa070b412
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qYF9Hk2RMp9N9tfHsgEnj7N0iV6d4DldVNkB+4sPpWLaaWXRH66JrLdngbUqrwMXaFCA7WHZKlnRhFnGc1ilWsR6VG7Z1jVPV5DFGWYPEAz9WaIukDGVTTS56ARoYCdFhmn/ZKlX68fBdMM5Don7yzOrO6Pa9zS+mc0R/GdiK6Iv2JLxawPRDy7fA9oGZuaoMoZjBfrlUq6fMfrnQxG9LqvzU5xOy1q1LM5drfkPVilZAuK6rRgHQ6x3slrprGdPlsdYIezeAPmgWWKWaDi4bj/AniFfBgFRJscIBBkjgPjsIJs+l6BJaPGvLYPkUUWLZqKV5FGFgmCiz5Vytc7bjdetXzoDoSjQWZrk2oSPS6LOakZuFsmx8gHdCNLzCZi7UH6dBH+vS3vF0oRs9887eY5HIwV/dbQV9tC5scT0smNg0LYED20G9ARsVC0h4rsbMZocGJt4SX1e6w0iy04JHcY999XerZ6Q6fDPgsVgozHf3S/saEkEMrb6yVEJkfiDMeTJnmlipRYHYVpnQr0lHNaU86QqhG2BgpYNBWFVCIS1XrZznd/BfLRj6cRNx0Z1Qmb2glEpX4RCUkixDarTxRyvHKmMmzN/Aab+H0rnjrqPMtMyvF8wfViALyvRdOEu/SMdU7XIwfZwS1I7Fd2qAXSxp/s8Wro88kx/zZWAExzQLz/gyO15YrazmQI2EB7E3ZhDtr+TuG4ufMbNJBCLU9P/5NoS9yoTvyv5ObZqN52xdMWg0sfRasJUeJD3Edd09LGiqCdsZajh/8i2iHtbT8UTvtjYdgXo2XKtxVRs3BBWMltMS1dSujr29hgnygHaygNVAhN8C8jrmNrItqZluoOocl7Fonsn6RZiUDnidwc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(316002)(6916009)(38070700005)(66446008)(8936002)(33656002)(36756003)(5660300002)(86362001)(66556008)(66476007)(64756008)(76116006)(4326008)(66946007)(8676002)(91956017)(41300700001)(2906002)(26005)(2616005)(6512007)(186003)(71200400001)(478600001)(966005)(6486002)(122000001)(38100700002)(6506007)(53546011)(83380400001)(66899015)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <200AE59D56EDBD44A2AFE8B9AA5639C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5417
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7283273c-98e9-48a7-c856-08daa070ae2f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ugdKmV8TYRxfW/kAmjq00cGM/1T5CqJsoed8gD+pijFSUiFAjqsf8uK153EZ6LizhVPdPa/x9gSA5HkaAjcHpAw1ZRUY/oKHxD2W/bBrUNd7vGZNUFkYBpuMeN6n75HNc+9uXKyDB/gQB09AncqmntoVqkp0bzeomCmKTM+lCQFDfeQLkLws9pH3zEeedh5Z5T/pPOigyt8Zwi8gfwEPAqkX3vgkZ4ldN+2mw5ppR9e6PXZEyG8FsUQvSicz/6uW5bgzQeeYFtMyu8HshG36jGc32ZzdY08rtIQI3+zVInviIx46BNBnZTEHoqkYu7m1yatDIpifW6S8zRa0Kkvh6n1d3Eq+7QHzH30SsFw4W6fDg/WEbSVeScjsDbUQexEZ6fhNhTQ4hqGYmms15CviM8cnFce9ZvfUeZt3oap6z2kREN4vuq7QCloOgeyElOHnqklMiqgTqK1CBnPhWQwk0UJI7nTBfDhLAt5kEWmGs90keKabuNhMdNmNU/z599HjEpgArjuwkX3UT7STI5qSIDU1JDYvsUY5y+1r7ad+y3vMISYd0H63LVN3yuOneQtP1yb6t9zdJtMkkj7WUtq83FtnLtYXI4CKZWZbLVdsVjhF9soiNhS9nrYefcD8YCDhjgDBtbf3eIw9oDT4411wQIXzEqNysImCUoF/1Xfpngh7KD0isX7OkoI92rKuahk4gkbImJIfAah5kuVx/Mln/cXJhvOBP7jE3KdDvouxWQ+6FgzefWdzbeGPwoJ+TYmVnHn5dQAtAYnolA75I2rcv3ZgsRkDPolvNvwqCNzimJ1rPCBDEV+LbmdFeXxRfMognC7KaXXZkIYP7qJOCTPp6A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(6862004)(41300700001)(8936002)(40460700003)(2906002)(82310400005)(70586007)(336012)(26005)(2616005)(478600001)(6512007)(6486002)(966005)(82740400003)(8676002)(316002)(356005)(40480700001)(70206006)(4326008)(81166007)(33656002)(66899015)(5660300002)(83380400001)(6506007)(47076005)(53546011)(36756003)(186003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:11:54.3121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54dfebad-05f4-41fb-2067-08daa070b412
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7509
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Sep 2022 10:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3843

SXQgYnJpbmdzIGl0cyBvd24gY29tcGlsZXIsIHNvIHRoZSBob3N0IGNvbXBpbGVyIHNob3VsZG7i
gJl0IGJlIHJlbGV2YW50Lg0KDQpXaGF0IGJ1aWxkIGNvbmZpZ3VyYXRpb24gaXMgbWFraW5nIHRo
aXMgYnJlYWs/ICBXZSBjYW4gYmUgbW9yZSBzcGVjaWZpYyB3aXRoIGV4Y2x1c2lvbnMgdGhhbiB0
aGlzLg0KDQpSb3NzDQoNCj4gT24gMjYgU2VwIDIwMjIsIGF0IDIzOjI2LCBLaGVtIFJhaiB2aWEg
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmc+IHdyb3RlOg0KPiANCj4gVGhpcyBkb2VzIG5vdCBidWlsZCB3aXRoIGNsYW5nIGZy
b20gbWV0YS1jbGFuZyBhbmQgYWxzbyBkb2VzIG5vdCBidWlsZA0KPiB3aXRoIGdjYyBlaXRoZXIN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IC0t
LQ0KPiBtZXRhLWFybS9yZWNpcGVzLWJzcC9oYWZuaXVtL2hhZm5pdW1fMi43LmJiIHwgMiArKw0K
PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0
YS1hcm0vcmVjaXBlcy1ic3AvaGFmbml1bS9oYWZuaXVtXzIuNy5iYiBiL21ldGEtYXJtL3JlY2lw
ZXMtYnNwL2hhZm5pdW0vaGFmbml1bV8yLjcuYmINCj4gaW5kZXggZDkwZjc0Ny4uMGM0ZTI5NCAx
MDA2NDQNCj4gLS0tIGEvbWV0YS1hcm0vcmVjaXBlcy1ic3AvaGFmbml1bS9oYWZuaXVtXzIuNy5i
Yg0KPiArKysgYi9tZXRhLWFybS9yZWNpcGVzLWJzcC9oYWZuaXVtL2hhZm5pdW1fMi43LmJiDQo+
IEBAIC03NywzICs3Nyw1IEBAIHB5dGhvbigpIHsNCj4gICAgIGlmIGQuZ2V0VmFyKCJCVUlMRF9B
UkNIIikgIT0gIng4Nl82NCI6DQo+ICAgICAgICAgcmFpc2UgYmIucGFyc2UuU2tpcFJlY2lwZSgi
Q2Fubm90IGJlIGJ1aWx0IG9uIG5vbi14ODYtNjQgaG9zdHMiKQ0KPiB9DQo+ICsNCj4gK0VYQ0xV
REVfRlJPTV9XT1JMRCA9ICIxIg0KPiAtLSANCj4gMi4zNy4zDQo+IA0KPiANCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRv
IHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMzg0Mik6IGh0dHBzOi8vbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtYXJtL21lc3NhZ2UvMzg0Mg0KPiBNdXRlIFRoaXMgVG9w
aWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC85MzkzODYyNy82ODc1ODg4DQo+
IEdyb3VwIE93bmVyOiBtZXRhLWFybStvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFVu
c3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLWFybS91bnN1
YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoN
Cg==

