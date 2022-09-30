Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D66C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 10:03:28 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.48])
 by mx.groups.io with SMTP id smtpd.web08.4009.1664532206105195850
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 03:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=DXsNHc/5;
 spf=pass (domain: arm.com, ip: 40.107.1.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hYX5W3C1VyeC2j4t2eL/uF+gYyL0jm0+BemtzLI2LzIi30h8qOVFmee1ZP7PuWN7arU8gHGxAwb0rvC0Q+hRqzZhmogyLnaKm22lYaM5GlyzhFH8v89iWAVMjDtHtRU1mqZ1bFBMlInIYhKioyH8aUuLB9hmx4E3XzzPDa4Uu6V4V34wrojzsktU6J/YRrF4MzJOHLVtClNAWlAqkwkCWYt8czKDbAcVsBDVJUlbB6kWg8oVyOCfolSEu4PQ2V7w0tOccNZBqzLXUPA6UNm6IUCY3cYkpdTyioejv/N/YFOkICZhBmBWSiyHzxWySeo70PSL8fvx9Uz11RJIOzRZBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqA6DUT4Re41PtNkTKLbM4qw93l0q+oZhkgTk0aN+Jw=;
 b=TrCT9+zV6xJqOm02E0q9CucHwOCNBCZlg1+wGMMXZOgzMRoXzigxd7oA+OEwO5C2al9GPyHgzZDLwcVXuL482dTp+VyarlSfTF/EnrNFd3az3QYTSSE3XbL8xYpfVSKAhHHLvLEV1e8mtDc1X4bgmtqYsX6CPSeHFmO6LulGifT080x2BHHoP3JrsW4bI4WyL18EWtT8r+6uEUKdM6m6kVrcoNotFGMwXtzDZDy7o9BUBhE6jT7brhpSjX2qgBdq+054cuQQmpNM6Pf01tfgFZo2QCKYRrzBF5SEtolvLH1QTDFplI9cfwzET9v6JJCOFrUjAiT3H2sWGEvKLgtQ1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqA6DUT4Re41PtNkTKLbM4qw93l0q+oZhkgTk0aN+Jw=;
 b=DXsNHc/5K2NMwCbNAoausl4Jvcn46klnLWe57iw0JiD6pfTYXA+/oAA245wDK5cBTPMsG0RgdWTIyEh3Er4rDUHDk/Fz6ZJTDzKYqkxVwG9WkNSkZXoBpb/qk/xLQFj9Pv83l9HQuPnqB0PffG8uRVn5xyugJ0BUufSfdPNdyU8=
Received: from DU2PR04CA0186.eurprd04.prod.outlook.com (2603:10a6:10:28d::11)
 by DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:03:18 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::ee) by DU2PR04CA0186.outlook.office365.com
 (2603:10a6:10:28d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 10:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:03:18 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Fri, 30 Sep 2022 10:03:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb04b786d215f0d3
X-CR-MTA-TID: 64aa7808
Received: from 3ad0c757c240.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 682ABD77-470D-4376-9BE4-F0155E6AD49E.1;
	Fri, 30 Sep 2022 10:03:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 3ad0c757c240.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Sep 2022 10:03:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyFoGFZ6mlTzrCIAp+RobPL2c5FT5zXvhNUhtwugtGha7Xp6sM8GmmrLMfeDTAvNjrRZWae99K2+22zgKQlydzaSmf4d2ASK/LaQ8QeZ5HSQeBylsO9G7liod5ghmeQoGwYSJsBYaa+fkkSdJfgAYoRZJ2w0EoeTDolNSGFs1Rm6QIOngkvfRNx3VakehH0Lj/8iLowtiHql3bbDJH0g8R3xvz+Y5p8kG5dYr0FaVD83K6tc08ppLSvrDRYWlJpchTl0c43glLmG8ouTYkkywGMc6ebH3lfVPT+BJl+2mBY5f7q9fidaR0f06d8sKYlUDvsAxUFs/r+KGTv3UJwIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqA6DUT4Re41PtNkTKLbM4qw93l0q+oZhkgTk0aN+Jw=;
 b=iUHkY3vaPUr5B056HP3mfQA1uly78mFtHTLOHfKbFLKzs94nkE8GzA+oPga5NXCZGkcYA2Wf80KJylPQDwxik0F4Qz1pGsW8qhAlMuzrAQ6lUGGuXBogOe9WNegbFPzQ5d7wdki7mxSLAbfdkA6Ze/RnhXhVHlD3IoTNr6W1k4WTqihBKVjIxNIReVPJe+iEq3LCuS6MUA6f7d7617JEPmUWKoWGqBbXUV3OaIthYdwouwbQBpxCr2sgdEy+kJDLvrWxWEve8LOJDyPfxho1juURwcSQTDS5P4L571f4UkRS8rnHbyquuG2pohKmZAaKKg7b2oQlekLIXIsLnBBGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqA6DUT4Re41PtNkTKLbM4qw93l0q+oZhkgTk0aN+Jw=;
 b=DXsNHc/5K2NMwCbNAoausl4Jvcn46klnLWe57iw0JiD6pfTYXA+/oAA245wDK5cBTPMsG0RgdWTIyEh3Er4rDUHDk/Fz6ZJTDzKYqkxVwG9WkNSkZXoBpb/qk/xLQFj9Pv83l9HQuPnqB0PffG8uRVn5xyugJ0BUufSfdPNdyU8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6615.eurprd08.prod.outlook.com (2603:10a6:20b:335::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:03:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 10:03:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] layers: Add langdale to LAYERSERIES_COMPAT
Thread-Topic: [meta-arm] [PATCH] layers: Add langdale to LAYERSERIES_COMPAT
Thread-Index: AQHY1F0Idoj842sb2EWp3hb0fRYYMq33vvQA
Date: Fri, 30 Sep 2022 10:03:09 +0000
Message-ID: <76DDEF7D-5729-44CE-BE8E-F1489A7A6715@arm.com>
References: <20220929234100.3608904-1-raj.khem@gmail.com>
In-Reply-To: <20220929234100.3608904-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6615:EE_|DBAEUR03FT031:EE_|DBAPR08MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f55f747-c023-452e-01b6-08daa2caff92
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XUxWsQXSgJy3ECmNYxYMncITxMVnyHMwZfcwrHhxIAx2QAH9upxjkzbhV6VNvM2TSjcG3CnDlYffFR76fOth4WCDAMPLs8p5rSTMsPFtT+1Z0Q8TghVcIuXUnlqXKLDuCcF6w2bjuQB4LA6PfM9G1EtI7OxtVSqoAd38DTV1ZzSrGRy5kGeXPdNWBXda8tJNH1HXSDuLvQz9bG11XUpklegfoM7F3f3OZEKPmBLGooJI/A/XSr+RLXBfOwBqzMu1PBhsn91VhKGlxx5A76f+gYMOZuNWDOnwmqRS0nFjS1kad5wHF2C6MNrQ24LfzbJ0ejJbyLM5PzgXgc0C4pGSBKITAXUy5JsONtTXtxbUSXCYp8pyaPDJHusetf/nGiVtx0jWsgp1Gql8Yi5beoBdNrD224O4mtEzGa4IUPIoBkHVtHFLYm/Gnkcp3CS+YvRWmvCWDk3BmhA42rZIH+oepGRAnIEu8S7pG0Uep+6OJCdk74AVwoIBYhJ2kevxI7Htv0sRWBVn8Y2dselfpM3v+FPpzbYDlh1kZtuDX/XCpq5l2hxN4v7K3alQlHkKqdFbr48bAOIAk2VNwpc0GsMpG6OznQhem5oSoTwVoHYUFEWrHlLZ2XgaqEJRFdxY/QkUjNgcNaHZlYI7ds/kHZhpKWOmQbrNZFMKchw8tqrQHlXB7enHWsgQscnsg7kEDVBPNzdLIxCo6mG+ChZutbTuOInCD2shENIqu6x2Yv2ehk3Qg9sXIKNv/6KnG40F1YQ0nf6/gNYIfbrFbtDK0YTCLOaIJsxH2tSufA5m0VgwDu0lte0C1eu/GmQ8g0eUbIX8ssuVp7Uk1kZZ3qtMREnUKQTQ/iJKsYqK0LN1HG29Lfg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199015)(66899015)(71200400001)(33656002)(2616005)(38070700005)(478600001)(966005)(6486002)(2906002)(6916009)(316002)(5660300002)(86362001)(8936002)(38100700002)(26005)(122000001)(66476007)(83380400001)(41300700001)(186003)(6512007)(66946007)(36756003)(64756008)(6506007)(91956017)(76116006)(66556008)(53546011)(66446008)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <63108B681C9DE24CB0126A00628C7E53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6615
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc760ea1-96da-4774-7460-08daa2cafa6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4T0zgiF/7a74fzNmndCo67Ba/pT8IluV8tY5yRlI+PVRtiaf7/ctkEdcemDGS1XUGKCNXlYPXipTuzDsiSRPhLf7/VD3cZgxlsIZM8VKw/ueSOxpQi3Jzx1Xu473t5P+Yt/NCvLN7Hr680CzbenVYhpctVr6r8rGqbmIW1+sQiSHmfYvHarXvtic2A7UCgrEPtI/U+USEOgAJEtgwyNEfa/CCN8kRqgvlBcQKhJDPTki/nI/swgDJXF/hXH8EprjPbk5amoCJybkRbqqvrBMUDHRFygS7Eni6+4V0aLXFGeMQcT3MWlXax4jIH0cIxQ6resMUJ8PLnBFrpYjpdeK/VO+Kpg+TGbcYgzOO1oW7W0o1bOGT36k7esCLi4dsHKnq4YvPg/k41XhVlw5NZWSh38Ijo4xm+Hc1zF34Hhx70MsA6YnbXktJDLa/Khtst4f+EfArLO2oVi8jXlIB8A9Feqc36O2P+ypyyqbOMH8Z7eB9vvqXTV2v6Z5wTlU75KF9FcuA2w8ZMLGAKONMBJJs9gxFNqCXeLfsrCLpS4npRFsZ4HUv5mJLQDehJF5e6D5YROcEgOKShd5R4UlMbcBoFZNyn11Jr4kVNQzy7Rrpm7TixgpGSM7IXZPhRHHXa9hNnxvqtkmzYliyPY9O+uUG6wT3LRugKlTfPbgCFXapZb9Q3q0PMI2mczMnQg2eApvCh6wrZjxycvIEMlOAn2YbFI84afegC5I0GGOYuPOt8H6AeZoGLh3UApx6B5INlyyRC2QgYMdHhS6p+UJjOQK12v6znrZa/C42oTmlvZ/VyA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39850400004)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(2906002)(2616005)(186003)(47076005)(336012)(82310400005)(356005)(82740400003)(81166007)(40460700003)(86362001)(40480700001)(33656002)(36756003)(36860700001)(8936002)(70586007)(70206006)(966005)(6486002)(66899015)(6512007)(316002)(41300700001)(478600001)(6506007)(53546011)(26005)(6862004)(5660300002)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:03:18.1042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f55f747-c023-452e-01b6-08daa2caff92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5558
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 10:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3881

SSB3YXMgZGl0aGVyaW5nIG92ZXIgd2hldGhlciB3ZSBzaG91bGQgc3VwcG9ydCBraXJrc3RvbmUg
aW4gbWFzdGVyIG9yIG5vdCAoc2VlIEpvbuKAmXMgcGF0Y2ggd2hpY2ggcmVtb3ZlcyBraXJrc3Rv
bmUpLCBzbyBJIHRob3VnaHQgSeKAmWQgYWN0dWFsbHkgdHJ5IGl0Lg0KDQpUdXJucyBvdXQgbWFz
dGVyIGhhc27igJl0IHdvcmtlZCB3aXRoIGtpcmtzdG9uZSBmb3IgYSBsb25nIHRpbWUuDQoNCkhv
cGVmdWxseSBwb3N0LXJlbGVhc2Ugb2UtY29yZSBtYXN0ZXIgd2lsbCBnZXQgdGhlIG5ldyBuYW1l
IHF1aWNrbHksIHNvIHdlIGNhbiBjaGFuZ2UgbWV0YS1hcm0gYW5kIHdlIGRvbuKAmXQgaGF2ZSB0
aGlzIGxhc3QgbWludXRlIGJyZWFrYWdlLg0KDQpSb3NzDQoNCj4gT24gMzAgU2VwIDIwMjIsIGF0
IDAwOjQxLCBLaGVtIFJhaiB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cmFqLmtoZW09Z21h
aWwuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gLS0tDQo+IG1ldGEtYXJtLWJzcC9j
b25mL2xheWVyLmNvbmYgICAgICAgfCAyICstDQo+IG1ldGEtYXJtLXRvb2xjaGFpbi9jb25mL2xh
eWVyLmNvbmYgfCAyICstDQo+IG1ldGEtYXJtL2NvbmYvbGF5ZXIuY29uZiAgICAgICAgICAgfCAy
ICstDQo+IG1ldGEtYXRwL2NvbmYvbGF5ZXIuY29uZiAgICAgICAgICAgfCAyICstDQo+IG1ldGEt
Z2VtNS9jb25mL2xheWVyLmNvbmYgICAgICAgICAgfCAyICstDQo+IDUgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEt
YXJtLWJzcC9jb25mL2xheWVyLmNvbmYgYi9tZXRhLWFybS1ic3AvY29uZi9sYXllci5jb25mDQo+
IGluZGV4IGExZTIyYzAuLjIzNmQ5YTUgMTAwNjQ0DQo+IC0tLSBhL21ldGEtYXJtLWJzcC9jb25m
L2xheWVyLmNvbmYNCj4gKysrIGIvbWV0YS1hcm0tYnNwL2NvbmYvbGF5ZXIuY29uZg0KPiBAQCAt
OSw3ICs5LDcgQEAgQkJGSUxFX0NPTExFQ1RJT05TICs9ICJtZXRhLWFybS1ic3AiDQo+IEJCRklM
RV9QQVRURVJOX21ldGEtYXJtLWJzcCA9ICJeJHtMQVlFUkRJUn0vIg0KPiBCQkZJTEVfUFJJT1JJ
VFlfbWV0YS1hcm0tYnNwID0gIjUiDQo+IA0KPiAtTEFZRVJTRVJJRVNfQ09NUEFUX21ldGEtYXJt
LWJzcCA9ICJraXJrc3RvbmUiDQo+ICtMQVlFUlNFUklFU19DT01QQVRfbWV0YS1hcm0tYnNwID0g
ImtpcmtzdG9uZSBsYW5nZGFsZSINCj4gDQo+IExBWUVSREVQRU5EU19tZXRhLWFybS1ic3AgPSAi
Y29yZSBtZXRhLWFybSINCj4gIyBUaGlzIHdvbid0IGJlIHVzZWQgYnkgbGF5ZXJpbmRleC1mZXRj
aCwgYnV0IHdvcmtzIGV2ZXJ5d2hlcmUgZWxzZQ0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1hcm0tdG9v
bGNoYWluL2NvbmYvbGF5ZXIuY29uZiBiL21ldGEtYXJtLXRvb2xjaGFpbi9jb25mL2xheWVyLmNv
bmYNCj4gaW5kZXggM2NiOGIwNi4uOTM1ZWI2MiAxMDA2NDQNCj4gLS0tIGEvbWV0YS1hcm0tdG9v
bGNoYWluL2NvbmYvbGF5ZXIuY29uZg0KPiArKysgYi9tZXRhLWFybS10b29sY2hhaW4vY29uZi9s
YXllci5jb25mDQo+IEBAIC05LDQgKzksNCBAQCBCQkZJTEVfUEFUVEVSTl9hcm0tdG9vbGNoYWlu
IDo9ICJeJHtMQVlFUkRJUn0vIg0KPiBCQkZJTEVfUFJJT1JJVFlfYXJtLXRvb2xjaGFpbiA9ICI1
Ig0KPiANCj4gTEFZRVJERVBFTkRTX2FybS10b29sY2hhaW4gPSAiY29yZSINCj4gLUxBWUVSU0VS
SUVTX0NPTVBBVF9hcm0tdG9vbGNoYWluID0gImtpcmtzdG9uZSINCj4gK0xBWUVSU0VSSUVTX0NP
TVBBVF9hcm0tdG9vbGNoYWluID0gImtpcmtzdG9uZSBsYW5nZGFsZSINCj4gZGlmZiAtLWdpdCBh
L21ldGEtYXJtL2NvbmYvbGF5ZXIuY29uZiBiL21ldGEtYXJtL2NvbmYvbGF5ZXIuY29uZg0KPiBp
bmRleCBjMjNlYTU2Li40YjMxNjFlIDEwMDY0NA0KPiAtLS0gYS9tZXRhLWFybS9jb25mL2xheWVy
LmNvbmYNCj4gKysrIGIvbWV0YS1hcm0vY29uZi9sYXllci5jb25mDQo+IEBAIC0xMyw3ICsxMyw3
IEBAIExBWUVSREVQRU5EU19tZXRhLWFybSA9ICIgXA0KPiAgICAgY29yZSBcDQo+ICAgICBhcm0t
dG9vbGNoYWluIFwNCj4gIg0KPiAtTEFZRVJTRVJJRVNfQ09NUEFUX21ldGEtYXJtID0gImtpcmtz
dG9uZSINCj4gK0xBWUVSU0VSSUVTX0NPTVBBVF9tZXRhLWFybSA9ICJraXJrc3RvbmUgbGFuZ2Rh
bGUiDQo+IA0KPiAjIHJ1bmZ2cCAtLWNvbnNvbGUgbmVlZHMgdGVsbmV0LCBzbyBwdWxsIHRoaXMg
aW4gZm9yIHRlc3RpbWFnZS4NCj4gSE9TVFRPT0xTX05PTkZBVEFMICs9ICJ0ZWxuZXQiDQo+IGRp
ZmYgLS1naXQgYS9tZXRhLWF0cC9jb25mL2xheWVyLmNvbmYgYi9tZXRhLWF0cC9jb25mL2xheWVy
LmNvbmYNCj4gaW5kZXggM2VjMzZlOC4uMDQzZDYwMSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1hdHAv
Y29uZi9sYXllci5jb25mDQo+ICsrKyBiL21ldGEtYXRwL2NvbmYvbGF5ZXIuY29uZg0KPiBAQCAt
Niw0ICs2LDQgQEAgQkJGSUxFX0NPTExFQ1RJT05TICs9ICJtZXRhLWF0cCINCj4gQkJGSUxFX1BB
VFRFUk5fbWV0YS1hdHAgPSAiXiR7TEFZRVJESVJ9LyINCj4gDQo+IExBWUVSREVQRU5EU19tZXRh
LWF0cCA9ICJjb3JlIG9wZW5lbWJlZGRlZC1sYXllciBtZXRhLWdlbTUiDQo+IC1MQVlFUlNFUklF
U19DT01QQVRfbWV0YS1hdHAgPSAia2lya3N0b25lIg0KPiArTEFZRVJTRVJJRVNfQ09NUEFUX21l
dGEtYXRwID0gImtpcmtzdG9uZSBsYW5nZGFsZSINCj4gZGlmZiAtLWdpdCBhL21ldGEtZ2VtNS9j
b25mL2xheWVyLmNvbmYgYi9tZXRhLWdlbTUvY29uZi9sYXllci5jb25mDQo+IGluZGV4IGQzMjli
ZDAuLjM4MDJiNDMgMTAwNjQ0DQo+IC0tLSBhL21ldGEtZ2VtNS9jb25mL2xheWVyLmNvbmYNCj4g
KysrIGIvbWV0YS1nZW01L2NvbmYvbGF5ZXIuY29uZg0KPiBAQCAtMTAsNyArMTAsNyBAQCBCQkZJ
TEVfUEFUVEVSTl9tZXRhLWdlbTUgPSAiXiR7TEFZRVJESVJ9LyINCj4gQkJGSUxFX1BSSU9SSVRZ
X21ldGEtZ2VtNSA9ICI1Ig0KPiANCj4gTEFZRVJERVBFTkRTX21ldGEtZ2VtNSA9ICJjb3JlIG9w
ZW5lbWJlZGRlZC1sYXllciBtZXRhLWFybSINCj4gLUxBWUVSU0VSSUVTX0NPTVBBVF9tZXRhLWdl
bTUgPSAia2lya3N0b25lIg0KPiArTEFZRVJTRVJJRVNfQ09NUEFUX21ldGEtZ2VtNSA9ICJraXJr
c3RvbmUgbGFuZ2RhbGUiDQo+IA0KPiBCQkZJTEVTX0RZTkFNSUMgKz0gIiBcDQo+ICAgICB2aXJ0
dWFsaXphdGlvbi1sYXllcjoke0xBWUVSRElSfS9keW5hbWljLWxheWVycy9tZXRhLXZpcnR1YWxp
emF0aW9uLyovKi8qLmJiYXBwZW5kIFwNCj4gLS0gDQo+IDIuMzcuMw0KPiANCj4gDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzM4NzkpOiBodHRwczovL2xp
c3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLWFybS9tZXNzYWdlLzM4NzkNCj4gTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvOTQwMDY5MTEvNjg3NTg4
OA0KPiBHcm91cCBPd25lcjogbWV0YS1hcm0rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0K
PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS1hcm0v
dW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
IA0KDQo=

