Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B4AEB64DD
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 09:11:45 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.69])
 by mx.groups.io with SMTP id smtpd.web11.6080.1687252296745460251
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 02:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BloWV81q;
 spf=pass (domain: arm.com, ip: 40.107.247.69, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nchdljKDJKLjRQ1Q2Q7Y3xSpnWgQnqFA8vVSAlOMz3M=;
 b=BloWV81qDt74kSZAd4ItAOU/JaC/tIRRq+4CcaR03KS9fBwESr2Fb8YwLolLNAHvhAHSgGYzY4ULBuOCIuOBjkEftIF8aEy4pb/bigR5E7bHKPVsikaEo3ZJOSBCyHBQmiepZvD9A23QTg87DepvPEogAJ5Sb0cmY0afkV9Btho=
Received: from DB7PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:10:36::20)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 09:11:31 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::7b) by DB7PR05CA0007.outlook.office365.com
 (2603:10a6:10:36::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 09:11:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 09:11:31 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Tue, 20 Jun 2023 09:11:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 236f95e424e4afde
X-CR-MTA-TID: 64aa7808
Received: from c3a7eaa86b24.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F0162A6D-E4F0-4EF0-B1BB-87903763EC69.1;
	Tue, 20 Jun 2023 09:11:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3a7eaa86b24.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Jun 2023 09:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSTGmOT7O25BIKc5QBhJeEDWbNIsN9SzjUPW3RaPDU9tmF4hc/eV48JZPMsl9ZqNHdoEOxOZaWn7k6/e7EL4f9VaSNCtDqYuiNRThyKa0bFsS4Y0Vy3Dud8sBZkxjykHoN5SI0/7DW9t2bjhZeMNSWVXHrs/SQkodLilbPE15kvv5t5tDS9x6aiw70e/qcgGkSLb3E+NX7SrBk6FEDs7V/jFBnoSVSwcVB1zeMMVSmEqVbcDYHo+0GfL2obUkLpL9gWjma51Vaiqdp01DpNuCj7Qyiqs2/hZ59d9SO+4INKkhPXDxVpN9tHXP3vCFF+xT3kTQ7OUQ6FeykwNLprKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nchdljKDJKLjRQ1Q2Q7Y3xSpnWgQnqFA8vVSAlOMz3M=;
 b=kjvAdPdZvhEBUth6S4ZsJuZ+UeLM0TCrqUDorB6AXQBkcMgZInw8EjHsf4Ghpau4pwshWmwWAAovuq9kQJSVpgZQtUzut2FfSnE51t2GqwdTuGdxwt/2mhGcrtd5+uDRFnF+egEEUNI60uv7iSVTOSb60S9SE4Yhkwhtl25XIW2jFcCaIsOdCR5932wB6l6r5HeMQVwzM3h0n9MRXFO/kIalR8O2OGAcABuIwUajfJjTbPcrZm/qouHcn6P+acMxKDG/JWeED1XMD35QJ+rn7kLbuX3B/pzTfHrxTGyvsMENWtPDAuTtCL6290IyWoJGHNx6L+paVVIveCbzeBnXmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nchdljKDJKLjRQ1Q2Q7Y3xSpnWgQnqFA8vVSAlOMz3M=;
 b=BloWV81qDt74kSZAd4ItAOU/JaC/tIRRq+4CcaR03KS9fBwESr2Fb8YwLolLNAHvhAHSgGYzY4ULBuOCIuOBjkEftIF8aEy4pb/bigR5E7bHKPVsikaEo3ZJOSBCyHBQmiepZvD9A23QTg87DepvPEogAJ5Sb0cmY0afkV9Btho=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9630.eurprd08.prod.outlook.com (2603:10a6:10:449::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.31; Tue, 20 Jun
 2023 09:11:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 09:11:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Jesus.JimenezSanchez@verifone.com" <Jesus.JimenezSanchez@verifone.com>
CC: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [yocto] meta-arm-toolchain: SUPPORTED file not found #toolchain
Thread-Topic: [yocto] meta-arm-toolchain: SUPPORTED file not found #toolchain
Thread-Index: AQHZosvMH8OS8Q69kEWXpYjGcJANdq+TaLiA
Date: Tue, 20 Jun 2023 09:11:23 +0000
Message-ID: <9C18040F-78ED-420B-A526-04FF2A5D839E@arm.com>
References: <5H3q.1687192403619815582.2AB4@lists.yoctoproject.org>
In-Reply-To: <5H3q.1687192403619815582.2AB4@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9630:EE_|DBAEUR03FT058:EE_|DU0PR08MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2111e0-7629-433e-e57b-08db716e568b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +Vvw+mTTUy/t0Gej2bpXXg1lm6JrPDL5IAwW66ZiEnxxEFlQr/JfkuDZCtVTZuWJNK42l5Otd1EQl38xQW2fVQIlxS9CH49Q787r9oCuAZ4c36kLkmFvsZcZSu/9HeveTUS6pP78esneVhnqvvNr4Lb5Br/DJvL1NE7Ruw5oflIWuUfB61t7dFgQCIGkRN7SiUPxmtLtN2Xt0k5ZeMwweW2AZ3dsge4ewVTlcdGmL343sqsirYwh77Epj66a8XJpEyDmu5PmNcG/SNwW8gJMFp0hN5ESM3jD+FM032zHo/3AgXuBTJHHPixbAdRKa9nFNB4xKadj++yyjnlqeq5VnFQ3RjCwZ90mndAy0ULIS/87BdqgZmBFY6hc87ObDPYmYovzizsaumzciPXjpSTxBGwkpL6prLV4IG+Ssdf9905Kx/RUyCXzjtMuWhfcC1ApCxrhboELwS+NWHbL/mYbjtcLN5HJ8XqRqgiNPGoZjyXycbd9Xsapz6Mihv1mXvf9oMPqdDv+T7bZSCfWQEXL48Ib53TC+0B2HC8OtL6pEqUZy+NLx3B9rc81qA0qFmzGl0uf7EnjegB1l/PTnUpgeMW/DrKOUUWAeGUex2pFn6cboaCr9xIUKQ+8M95LZyJ4v7aWXUwGalj0t//mLcdD4Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(8676002)(8936002)(2906002)(5660300002)(71200400001)(54906003)(41300700001)(316002)(6916009)(4326008)(64756008)(91956017)(66446008)(76116006)(66946007)(66556008)(66476007)(33656002)(478600001)(36756003)(6486002)(38100700002)(53546011)(86362001)(186003)(2616005)(122000001)(6512007)(6506007)(26005)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <713EA9B75CC3104B9665B96BA8DADBB1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9630
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1ffe548c-0269-4a73-7f52-08db716e51c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uBHeaN8JgcMikRf2fveyG6ngjX6a0JWYBf2i6VNeRYyycq3Otq3VTgV0EfJaPm/qWvqxI+GUFmGO59VmJHCb0QPJn8ZeYrxvFPfZCAqkbuTKYdcANSIsxITqNR7v/zCoq3sSZm9LcJN/RRw/Pnd9glIow8z1Kb8skJaC73+tOgpswBV/5QtHqJHfxsytKGl80L+GDGUMryfbwGOTP/8mexL5qyW/JCDMEBBAOndIB4wKLlKE+A1ZHf6cQnXfUz/whkQ6t/GD47De2Z6tngx69JoCLXzyRGKp0mkjbh7GX2+aWLTrGCaPPQ6KGZRcS8qq8cmp2xfNGZ4PCsGdFxgX0CNlyqZ5/XcmVT3s8bAOACNzY9MRVYtACgG6pyOZncrHG7dakW1hn6xXSejpqMbe3dNNasOAyAo1KYZk8vIBKyPoeTONDBx7gExr4nM7tgqzfwOxCUG0Fu5ZhWDivX0eOoo5NwuXvtPBQFWdzb1Andqc+/H+dlIgNq4SXthHu2BSuvzCj4eN+8YZlBqLCtNRTcAEVR1s3IcR406oYeP8NyID64F5Fyzf8Gu/JuyLp9DITlzoUycAHmzwAZIzC8cterdzrFBDDXY3DJHxsasHr1ZOwFl244OTJWRe20fEGx3IsMsVHAEUIResUgS24jk7wijTRm4lKypuPIbFEgGdpz9BQRecq0MN9VzoXTwCeiPx2vLDEisfP0lZTWh1ijg00Wg/2kuC8+4baKrst4JozHac1M4uUkHv4uV/5KdPbp4O
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(2906002)(6512007)(6506007)(26005)(2616005)(33656002)(186003)(450100002)(70586007)(70206006)(6486002)(6862004)(8676002)(8936002)(41300700001)(316002)(4326008)(478600001)(54906003)(5660300002)(336012)(82740400003)(81166007)(356005)(40460700003)(82310400005)(36756003)(86362001)(36860700001)(40480700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:11:31.5250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2111e0-7629-433e-e57b-08db716e568b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Jun 2023 09:11:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4807

Q29weWluZyBtZXRhLWFybSwgYXMgdGhhdOKAmXMgdGhlIGJlc3QgcGxhY2UgdG8gZGlzY3VzcyB0
aGlzLg0KDQoNCj4gT24gMTkgSnVuIDIwMjMsIGF0IDE3OjMzLCBKZXN1cy5KaW1lbmV6U2FuY2hl
eiB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8SmVzdXMuSmltZW5lelNhbmNoZXo9dmVyaWZv
bmUuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPiANCj4gSGVsbG8sIEknbSB0
cnlpbmcgdG8gYWRkIHRoZSBhcm0gdG9vbGNoYWluIHRvIG15IHlvY3RvIHByb2plY3QgYnV0IEkg
anVzdCBnb3QgdGhpcyBlcnJvcg0KPiBgYGANCj4gfCBjcDogY2Fubm90IHN0YXQgJy4uLi90bXAt
Z2xpYmMvd29yay9jb3J0ZXhhN3QyaGYtbmVvbi12ZnB2NC1vc3RsLWxpbnV4LWdudWVhYmkvZXh0
ZXJuYWwtYXJtLXRvb2xjaGFpbi8yMDIyLjAyLXIwL2ltYWdlL2xvY2FsL1NVUFBPUlRFRCc6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gYGBgDQo+IEl0IGNvbWVzIGZyb20gdGhlIGBleHRl
cm5hbC1hcm0tdG9vbGNoYWluLmJiYCByZWNpcGUuIEkndmUgY2hlY2tlZCBhbmQgdGhlIGBTVVBQ
T1JURURgIGZpbGUgaXMgaW4gdGhlIHJpZ2h0IGZvbGRlciAodGhlIGBmaWxlc2AgZm9sZGVyIHdo
ZXJlIHRoZSBgZXh0ZXJuYWwtYXJtLXRvb2xjaGFpbi5iYmAgZmlsZSBpcykuIEkgaGF2ZW4ndCBt
YWRlIGFueSBtb2RpZmljYXRpb25zIHRvIHRoZSBtZXRhLWFybSByZXBvLiBJIGp1c3QgY2xvbmVk
IGl0IGFuZCBjaGFuZ2VkIHRvIGJyYW5jaCBga2lya3N0b25lYC4gQWZ0ZXIgdGhhdCwgSSBoYXZl
IGNvbmZpZ3VyZWQgbXkgbG9jYWwuY29uZiB3aXRoIHRoaXM6DQo+IGBgYA0KPiBUQ01PREUgPSAi
ZXh0ZXJuYWwtYXJtIg0KPiANCj4gRVhURVJOQUxfVE9PTENIQUlOID0gIi4uLi9nY2MtYXJtLTEx
LjItMjAyMi4wMi14ODZfNjQtYXJtLW5vbmUtbGludXgtZ251ZWFiaWhmIg0KPiBgYGANCj4gDQo+
IEkgaGF2ZSBhZGRlZCB0aGlzIHRvIHRoZSBgYmJsYXllcnMuY29uZmA6DQo+IGBgYA0KPiBCQkxB
WUVSUyArPSAiJHtPRVJPT1R9L2xheWVycy9tZXRhLWFybS9tZXRhLWFybS10b29sY2hhaW4iDQo+
IGBgYA0KDQpDYW4geW91IHNoYXJlIHRoZSBmdWxsIGxvZ3MsIGluc3RlYWQgb2YganVzdCBvbmUg
bGluZT8NCg0KQWxzbyByZXBsaWNhdGluZyB3aXRoIGp1c3QgcG9reSttZXRhLWFybSBhbmQgYSBi
cmFuZCBuZXcgYnVpbGQgdHJlZSAoc28gbm8gbG9jYWwgY29uZmlndXJhdGlvbiBvciBsYXllcnMp
IHdvdWxkIGhlbHAgZGVidWcuDQoNClJvc3M=

