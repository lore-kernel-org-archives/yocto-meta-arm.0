Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2EACD11DD
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 13:05:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.87])
 by mx.groups.io with SMTP id smtpd.web10.37053.1711544705191155113
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 06:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OLpT3RSa;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OLpT3RSa;
 spf=pass (domain: arm.com, ip: 40.107.104.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=j662uRnvzJzqz4IIyvG8QHaSsi1N6WbljxvNfOY2O8pXJ+B5qWpnRb3Gh9+1z/9gJzpxDopyJCdDjkqSiExtjYKyuxeXOGdDjvt1CvKgkC+7QuPmvZHkGxkpXUhqcxxbZHwOHjbYbs32jxpUVbY1cf21b01iSQXf+GrHXyfbdfPU+rfOsGFW5d7UruCTr72JjmEX4xmXgLvD1gJ7M9V8dK5Zp3L2ypxxSVGEuq5HI4nm3fkahq0XvS11P/tsvpY3YrPMmC/CIlB07Nf5vP03rnPTsVMwOGbXg3zuMV1kZ3mlQZSUb+JCN2esNq1BgDTab/x7lrrgXIxORleg4f1bIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pH7672REhlpKbZHPVsf68EfCC6ihZ3MFAUXrwE+460=;
 b=Hy/IAXjeWFla3CGZh9DmD+0v+MHXdZ/iDhrjQ6l3Jo3xeQUQ/+mVFijLZ8XMiCJrp9u0x1Zu43zY45mokjD+VyCZg6iUfmoJsx8KQE2rPfVPiL4EJQbvSf+gMBSO5qIPjpk1hsdHl2kQ10k7b4W58mFhSPNV2AcB42p6tLtfRyWjrEHpQ6GZHf22TDwWgKCWqFD8kYI6PMayp0XLCOLJVB/zEnL8+X7wpAhzZMw9QS1HSyrIpT7DeYYpVC29bXZ2smkgb0X173zDpGPQOB2eOwOh2qaEesHWOuJgiRXeZaJkbSkhJCFnpH7qamaXzrJVX/r6PYcTr74hA0vcnkBUfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pH7672REhlpKbZHPVsf68EfCC6ihZ3MFAUXrwE+460=;
 b=OLpT3RSaX2imwU8MCXE5S8XpLf16f20SOfLxSMjBqC0FJsgNYCJUOoAHzMvy9H8Z8XMfJsF6cVNBaJlEolf30GbiuJzwXwl6WQyurdiaKyaTQz7hdWArCKZ3cH1zXwM918IU1QNqwyGu/92pWjqkqsnEoytZEoRUire3FfG7b3o=
Received: from AM4PR07CA0028.eurprd07.prod.outlook.com (2603:10a6:205:1::41)
 by PAVPR08MB9625.eurprd08.prod.outlook.com (2603:10a6:102:310::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 13:05:01 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:205:1:cafe::b8) by AM4PR07CA0028.outlook.office365.com
 (2603:10a6:205:1::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11 via Frontend
 Transport; Wed, 27 Mar 2024 13:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 13:05:01 +0000
Received: ("Tessian outbound dc0a9029eb2c:v300"); Wed, 27 Mar 2024 13:05:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3fd40df62cb5a63b
X-CR-MTA-TID: 64aa7808
Received: from 02daaf99529a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0729A822-E4EB-438A-88ED-3601D893D817.1;
	Wed, 27 Mar 2024 13:04:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02daaf99529a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Mar 2024 13:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3KZuBD3Ew04AM5Q3veg/lfek5jwjGDGh0vGNgx/ft6kwXz+BGqvxKxw98MfgiP9Tt7io8k1Adar4rgE19zF16JnAU+WktVcjFPYNC5PmbEG51f1pD1TLHNRmwmo9asWlDiQv2vKV2aLpLwI/vu1lSzkSPMiLygx0Q9ciNLEZrE2d0uYC0B0In11sn+Cim1/L9zaQxTUXqxYu52fZZkfLC8b3nIkZwnDO8ss9gB+0TvfZszgmB/tiT5vyCCKqOd4TNh2PauwkXISJyKMgLjpNm0kanOsOHxI0tBFSb+ARbjw2q2QMy7SyjP+fFeAEQxjAFfAbnV/w0S/A2Ye9PjmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pH7672REhlpKbZHPVsf68EfCC6ihZ3MFAUXrwE+460=;
 b=jwu8AxoXEsbGRL9cjQIPuT6ERlaDn2xxXgXmFRVuWFYMWG/5irXe41ZrT2y3QCOpHwvHOde+qw4PEYkltTQNiucvhROQF9tG12nJLHvEEPXjWkixmVr4JpwGkIcxONmWQ2fWSlHO+t1zLORoSbzGfXHdstwg8+jAAuOULaJwSxe/hqdx27Zv26Ldqzzv5elshK/sOyn9Kvey77vpVzKlBR1JTx+UFHq/y1s5sXoOrVbt9E5T9gX0KvQ+LLOW2M2fYEuj54KxRhrrkHZ5YzTD/Crcefg8er4XEP07iFd5jkCx/CeuZUfUerbKJk0NBdC0xn5k7ZsAvsSTm3T9i94ZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pH7672REhlpKbZHPVsf68EfCC6ihZ3MFAUXrwE+460=;
 b=OLpT3RSaX2imwU8MCXE5S8XpLf16f20SOfLxSMjBqC0FJsgNYCJUOoAHzMvy9H8Z8XMfJsF6cVNBaJlEolf30GbiuJzwXwl6WQyurdiaKyaTQz7hdWArCKZ3cH1zXwM918IU1QNqwyGu/92pWjqkqsnEoytZEoRUire3FfG7b3o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6479.eurprd08.prod.outlook.com (2603:10a6:102:157::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:04:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 13:04:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Jon Mason <Jon.Mason@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Thread-Topic: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Thread-Index: AQHaf7sDSdNC+CzmRk6maLephsz8+bFLjzYA
Date: Wed, 27 Mar 2024 13:04:52 +0000
Message-ID: <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com>
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
In-Reply-To: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6479:EE_|AMS0EPF000001A3:EE_|PAVPR08MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: c9945fec-5e44-4462-5c19-08dc4e5e8335
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZpTZFygrjNJ86m9j2JQV2eOxtLxPGECFqWSwg0/KfcuPlmL5I1AUKShS3yjH76h/QPsdJgloP0y2CEW01WsXbWB8NC+iIdD4bguoGloGOJJPJz1OBjewfSKCMjh5wieVkj7irsm5N0jlqqzZXVLEw5YosO4KDnJBTCyX8JQoSGIfzyZRTWc3SHTsMjEAPSsVGuA11VggGxKub32w5iqj2ls6QnGIqLj/EgtP7mmxxZKN/qDCb6+kYtPF3NKBazQfFh/E62hE87CMurGZabyCYlTZRnxoWekW/gAzZlN5r1b0GNZs9HZ+WfXVnkzHK3M09QlGBcghaeqn1ogUMmr6LNeWp8GnMieAPNmxtvc4qDC8gDzqk1lj7PsV8cyeOADV1C5Ejfm8RGHbdUi7z5JF935zgntROddhrSLrqhthOsKe51uZe/xvF05WezZE0PyfpE6EUwlbKVEVCyTCKsqErcKsCrv7BwgXogJ04W7LwNuxvGPLUs7gfDN70pucvQqytslGGP3UM8A0m2lqxmKKoE0Rh7JUcFfX3+MzV9U+kdnUrBR2W0EL7J5t+0nspZdtKhjy7doDulfiYqOKDVSCvBTkfwlDQYLI05vMTotcrjY+fI3EdfM2fXso456E51I6fjsjK0vg9Ox1A+Bo16Xc8yOQ7A5CGy6ArplZVZorpQmMrmxqwwXrGc/vZXhuNdc/iagA1TqXVgGd0tyusDerta+PZ5foAEL0EJySNyTGvBY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <79397AA7B87EE347A583A80322A520A0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6479
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f4893886-61dd-4ac2-c6c4-08dc4e5e7dd7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/R/voUupi+pYiAIVXCK2QCgip3rMhC5cd95+GnQ89wAmhoeUV0lO0y8Qni7JLGQPikba015ewuM+jla0QSzkU8e+uJWwmmIcx8dGy41rAg3iCiQ9OGooaT49D6I7MJN7lOba24XuLHjEu2CLK8+DhyyZSJDchMWo0GfL0WdP83XBzLiyqHKVyC3crFDBobAPpXRDtQ2/01u+toQo7lG/MMfm1nOXDSCBTjKBRmKD0fhge/I5Vf9zep4I80S9yJAlUkG4lZcQokUipD2EAN+AlGi00ynZDvE15iz5omrVJW3hJ4BuwfyRS68EWVE44Az12hrdKjpxIfjgJfpelCCSf3eq8kSEGebMtpWAyiW8VCI7K3kvZAqy3JHoUlYQpRoxKnP3xQZEifCLaSxwE1dr6pD4AvkX8CboaU+tJvbpEHyB9d9ljUy40qSkwtAm0U8jbp1qE+qK3zz1Rh7kZwwP33Kn9I+y5eU7G1snhZiuSRy93XmN0zlwtRUtvb7WIuvbYLLWNzIGDSnYYOFZzBvFLArHoh6vBceOz3KPOnCrLC3mZLLCiwBRdlkwR3ti7PD7x5l5wAsSXACFrJoOR9vYVdoFfNy2t9wZJYyOusz5AVHAi1IjXLpfKNYqQlt82hQeF54YQddySQfaGPlwk5ewEakLpmih0XHiZZ7DN8DHPJ/vmUHfq8mhXEUsLLUoYvH5oypit0XtTyg8xbGDdphj0UVHHysIALl7jCMgGUkYkGg4q1/82Fl7519tBmsevqxv
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 13:05:01.4347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9945fec-5e44-4462-5c19-08dc4e5e8335
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9625
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 13:05:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5492

SGkgTWF0dGlldSwNCg0KT24gMjYgTWFyIDIwMjQsIGF0IDIwOjIwLCBNYXRoaWV1IFBvaXJpZXIg
PG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gK1NSQ19VUklfUk1NICAgICA/
PSAiZ2l0c206Ly9naXQudHJ1c3RlZGZpcm13YXJlLm9yZy9URi1STU0vdGYtcm1tLmdpdDtwcm90
b2NvbD1odHRwcyINCj4gK1NSQ1JFVl9ybW0gICAgID89ICIwYTAyNjU2OTQ1ZDY5NzU3YjA3Nzkx
OTJjZWJiOWI0MWRkOTAzN2QxIg0KPiArU1JDQlJBTkNIX3JtbSAgICAgPz0gIm1haW4iDQo+ICsN
Cj4gK1NSQ19VUkkgPSAiJHtTUkNfVVJJX1JNTX07bmFtZT1ybW07YnJhbmNoPSR7U1JDQlJBTkNI
X3JtbX0gXA0KPiArICAgZmlsZTovLzAwMDEtYnVpbGQtbGliLUFkZC1leHRyYS1yZXBvc2l0b3Jp
ZXMtZm9yLXN5c3RlbS1pbmNsdWRlcy5wYXRjaCBcDQo+ICsgIg0KDQpJcyB0aGVyZSBhIGdvb2Qg
cmVhc29uIGZvciBhbGwgb2YgdGhpcyBpbmRpcmVjdGlvbj8gIElmIHlvdSB3YW50IHRvIHN1cHBv
cnQgYnVpbGRpbmcgZnJvbSBhIGxvY2FsIHNvdXJjZSB0cmVlL2ZvcmssIHRoZXJl4oCZcyBhIGNs
YXNzIHRoYXQgZG9lcyB0aGF0IGdlbmVyYWxseSAoZXh0ZXJuYWxzcmMpLg0KDQo+ICtSTU1fQ09O
RklHID89ICJxZW11X3ZpcnRfZGVmY2ZnIg0KDQpUaGUg4oCcZGVmYXVsdOKAnSBpc27igJl0IHFl
bXUsIGFzIHRoYXQgaXNu4oCZdCB1c2VmdWwgZm9yIGFueXRoaW5nIGJ1dCBxZW11LiAgQSBiZXR0
ZXIgc29sdXRpb24gd291bGQgYmU6DQoNClJNTV9DT05GSUcgPz0g4oCcIg0KUk1NX0NPTkZJRzpx
ZW11YXJtNjQgPSDigJxxZW11X3ZpcnRfZGVmY2Zn4oCdDQoNCkFsc28gdGhpcyByZWNpcGUgbmVl
ZHMgc29tZSBDT01QQVRJQkxFX01BQ0hJTkUgc3RhdGVtZW50cywgc28gdGhhdCBhIHdvcmxkIGJ1
aWxkIHdvbuKAmXQgdHJ5IGFuZCBidWlsZCBpdCBmb3IgZWcgcWVtdXg4Ni02NC4NCg0KPiArQiA9
ICIke1dPUktESVJ9L2J1aWxkIg0KDQpjbWFrZSBjbGFzcyBzZXRzIEIgYWxyZWFkeSwgcmVtb3Zl
Lg0KDQo+ICsjIFN1cHBsZW1lbnQgaW5jbHVkZSBwYXRoDQo+ICtFWFRSQV9PRUNNQUtFICs9ICIt
RENNQUtFX0lOQ0xVREVfUEFUSD0ke1dPUktESVJ9L3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRl
Ig0KDQotRENNQUtFX0lOQ0xVREVfUEFUSD0ke1NUQUdJTkdfSU5DRElSfSB3b3VsZCBiZSBuZWF0
ZXIsIGJ1dCB0aGlzIHJlYWxseSBkb2VzIGZlZWwgbGlrZSBhIGJ1ZyBpbiB0aGUgQ01ha2VMaXN0
cy50eHQuICBXaHkgZG9lc27igJl0IGl0IHJlc3BlY3QgdGhlIHN5c3Jvb3QgdGhhdCB0aGUgY29t
cGlsZXIgaXMgdG9sZCB0byB1c2U/ICBXZSBjYXJlZnVsbHkgY29uZmlndXJlIGEgdG9vbGNoYWlu
IHRoYXQgc3BlY2lmaWVzIGV4YWN0bHkgd2hhdCBjb21waWxlciwgc3lzcm9vdCwgZmxhZ3MsIGV0
YyB0byB1c2UuDQoNCj4gK2V4cG9ydCBDUk9TU19DT01QSUxFPSIke1RBUkdFVF9QUkVGSVh9Ig0K
PiArZXhwb3J0IENNQUtFX0JVSUxEX1BBUkFMTEVMX0xFVkVMID0gIiR7QG9lLnV0aWxzLnBhcmFs
bGVsX21ha2UoZCwgRmFsc2UpfSINCg0KQ01ha2UgY2xhc3Mgc2hvdWxkIGJlIGRvaW5nIHRoaXMs
IHJlbW92ZS4NCg0KUm9zcw==

