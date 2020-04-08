Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web11.10549.1586350536284752230
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 05:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bFbwdtnq;
 spf=pass (domain: arm.com, ip: 40.107.20.40, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usQOj0KLparB0xn6VcZp6/5fCREBTHkTTAvQYQmtEKg=;
 b=bFbwdtnq8tGREdCx0HP1XmPoC7dp5h5nTmd9vEUBhwcEESVj4vIIBAvMo81e7PC/SZwXAgBUe24VW47WiTTx66v0FSSDe7npTTls0WYT7GNsgupYcfpbUJpM7B3fStxmxPja8f0VTkVDNL9mGIqyN0zzZzOhbegO+NsZ18IWRog=
Received: from DB8PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:10:120::22)
 by AM6PR08MB4502.eurprd08.prod.outlook.com (2603:10a6:20b:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Wed, 8 Apr
 2020 12:55:34 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::f1) by DB8PR06CA0048.outlook.office365.com
 (2603:10a6:10:120::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19 via Frontend
 Transport; Wed, 8 Apr 2020 12:55:34 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 8 Apr 2020 12:55:34 +0000
Received: ("Tessian outbound 55454527ea3b:v50"); Wed, 08 Apr 2020 12:55:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ab4f5306e617a58
X-CR-MTA-TID: 64aa7808
Received: from 54a29da4814b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C99B5DCF-B0C4-4D4E-9A90-4EDB0A800F36.1;
	Wed, 08 Apr 2020 12:55:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 54a29da4814b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Apr 2020 12:55:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbe8UdJIg6sItZdmP7y2h1BfRKmHuo7+cj9WJriMpHyLvNLkcYkrgGgXIx+/tYJSFpIIMWNKYixCTJAIoktHIo4mcCEXy6CvVWlFuVHSR0VINx4JzEA2/VT+AMCaTpF6qqRhKoivV42pTds78ACl562zo3Kt/Y5SlQ9kCPjkeR48jPQS52YRExyuaaqPjiRwDWbK3+GQ9PYlE0RH8i8nxqUe2zfn9rh/LVi0TJPVG/uKVFMZjfKVKBO4zJ7gQ48su/RN6vjH9tnw1qsMU3loKZvk3Phz9PubhRD+nnVce2sp63q1v681K7qhHYZ9UbFP8ffVgmVWvXrdvJkMaFrNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usQOj0KLparB0xn6VcZp6/5fCREBTHkTTAvQYQmtEKg=;
 b=P1LaoD74XpmPGiwhFO6VQOZEWOhh3n9CYXT6k48LvyA+Myd9PPCgd4tkfio+FfAUAG67XqDCzWBg7FXTZUtGgRZchyBs3lbWAYezgf3MbpxT9OfMMkz/QIpPWldZYTYVzJOQ7SniLrE+cAfWiqLweGDATOZzkYiLG37XTSo+zEH+nLebna+PvwPSZnfjKhTdzq4lQVCp1D81Oc9n8nChZMtGYaRKv9KSCyZpnucoo75JGbcYNsnNN3Kjr/ft6oApd+yzYup+I64o10SgrC3JlcHsP/3bRXurxsfhUIILjA0TeQHpbjhH9RTT0K6TDS5lHPJq4nX9aXkP4KnJQXFx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usQOj0KLparB0xn6VcZp6/5fCREBTHkTTAvQYQmtEKg=;
 b=bFbwdtnq8tGREdCx0HP1XmPoC7dp5h5nTmd9vEUBhwcEESVj4vIIBAvMo81e7PC/SZwXAgBUe24VW47WiTTx66v0FSSDe7npTTls0WYT7GNsgupYcfpbUJpM7B3fStxmxPja8f0VTkVDNL9mGIqyN0zzZzOhbegO+NsZ18IWRog=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB3071.eurprd08.prod.outlook.com (2603:10a6:803:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Wed, 8 Apr
 2020 12:55:26 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358%7]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 12:55:26 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-autonomy:init-ifupdown: Fix interfaces.d sub-dir scan
Date: Wed,  8 Apr 2020 13:55:20 +0100
Message-Id: <1586350520-13681-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0332.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::32) To VI1PR08MB3998.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0332.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2878.21 via Frontend Transport; Wed, 8 Apr 2020 12:55:26 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e36ab780-0e59-4bff-a130-08d7dbbc2088
X-MS-TrafficTypeDiagnostic: VI1PR08MB3071:|VI1PR08MB3071:|AM6PR08MB4502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB450257B702C745F4D4597E0392C00@AM6PR08MB4502.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(5660300002)(52116002)(36756003)(6666004)(6486002)(6916009)(66946007)(66476007)(86362001)(81166007)(8676002)(66556008)(478600001)(2906002)(8936002)(7696005)(26005)(4326008)(2616005)(186003)(81156014)(956004)(44832011)(316002)(16526019);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IhwTih5s8pyl63CHlb97qqAqC1M+Jwt5fR329mC66pHmEJDtVg+S0gfL2Xqkn0pE/R297UmlUm+xbtN1Tp/qeDnJuNYCgNlngytjvaCq0xQU9BcNl7LrRqXeG34MUYLn/TeEtnvDDdftx8gJYKbJK5pberY9QCsmy5VjJY0GLVkAt4UIXvdeXZzTSTReCsn74XaW+ccxRb0zUK/Vb7gp5IXbySfTkyA7K8koHniCLkRvwhIzSQSgwOl9XEn0JtbVhvReNLgb1ypVRLSCuqccpfZi4z2fXApeec4ynKUbrtmKWJlnAXwB/AkUHAdyMrt8mTBGBVTaI5Hm3eJNkPiPwltI1wRUs2DvjDFNwlgptpUvbSFXa6puv61PHIh7xKJgH3fLAb+MW7asqQKGI1eMOEgbtor4ARSbdejl2VT1WVyca1w+/RjKOJgM2UkNHdAK
X-MS-Exchange-AntiSpam-MessageData: 
 w5gDicDwx1hCmH2YqSgaWNazElgDUt3Z4BYfWMsRQz09IlYvRbLUST86HbmMkxN7AYedd+XfU5aq6/tFLsfy1ICAWDnYQCgE60bNsIt52OCI+onpU7hVgHVSqzsau0tw7oLEp/zEjxAkr4FrTN87LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3071
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(5660300002)(336012)(2616005)(6486002)(356004)(6666004)(956004)(36756003)(81166007)(4326008)(16526019)(44832011)(478600001)(186003)(26005)(26826003)(7696005)(70586007)(8936002)(70206006)(6916009)(8676002)(82740400003)(47076004)(86362001)(2906002)(316002)(81156014);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2c78d9a6-d053-4ffd-7f96-08d7dbbc1bd6
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UHETinqfziKK9uqGNstsvC4ltYO1x+DveLDxn87oNDeSnLka6A49e7/ZqbSuT2AyWlm9BpCKf/z7OF6NwPu0ONwOsFgk23+s52ReunPuNBQ9goTXoTxbx7AjktrooQcrAverr8LPpkU7tkJVheUk4sjCoftZXY+4lPuW9uMPfc5R9acy3nMDDyUuSK6vjUtxE30nXib/3+rhfKB6676M1hNTljliTv1GmNncN5KMniUdq50d6+xiBEUGqy7ropqkY8QZUZNOyw9XZ7W32GiYKMr4exbAe0+I5Wl6YCgnu97qcd7VNr773ISNrzjVxTRunjc8M/KNC2rGN2cVSuKf1i0FC3jGJREEXc9tzDnaD8ZFrcgpxHIKkRPYKXsNjrOqxINhHpstUSdN86OWwhbRqptcd/mTrePyVBainK+jM72B1zZQk1Not4LbP99uB3N+WRv1FuDAqf1qWNvYVDe/9Ia87qt/o+MA+1XaM9j48s+uu+a79XROsaaKf/kxOHpPuy6a8DWPMcm1wCoohCV24w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 12:55:34.2314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e36ab780-0e59-4bff-a130-08d7dbbc2088
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4502
Content-Type: text/plain

Add a missing line breake ("\") to do_install_append to effectually
append the "/etc/network/interfaces.d/" line into
"/etc/network/interfaces" file.

Change-Id: I1cf4e134639d1f63ada7d068cc2822d1ac4218ea
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
index 2181210..1d97e50 100644
--- a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
@@ -6,7 +6,7 @@
 do_install_append() {
     # Add scan of interfaces.d to interfaces file
     cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces.subdir
-    echo "source-directory ${sysconfdir}/network/interfaces.d/"
+    echo "source-directory ${sysconfdir}/network/interfaces.d/" \
         >> ${WORKDIR}/interfaces.subdir
 
     # Create interfaces.d script in case nobody is adding a script
-- 
2.7.4

