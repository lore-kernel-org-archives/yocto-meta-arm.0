Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.88])
 by mx.groups.io with SMTP id smtpd.web11.4226.1596622622828462985
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 03:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AX7yBuOI;
 spf=pass (domain: arm.com, ip: 40.107.6.88, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjIyUctv67LbmqfY/D1F9DsIPt8FjM7kGIYLmavWhp8=;
 b=AX7yBuOIriszaDiUgOue7Cggis1j/7rbkwgyG+k9MMXFUr8WMzbAt1Myl+hti96HIlw1+oqJXj3gHdXgHy4NVY1gjcJXrt0Q7Mp0ZGm4HJUZJP/3sZ19K+fDnKxJMVj3Jrj4bv56Fo12alOcJu7COKxDln+AMD7igZY6iG41EZc=
Received: from MR2P264CA0122.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::14)
 by AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 5 Aug
 2020 10:16:59 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::8a) by MR2P264CA0122.outlook.office365.com
 (2603:10a6:500:30::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Wed, 5 Aug 2020 10:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 10:16:58 +0000
Received: ("Tessian outbound 6ad80ee94e7f:v64"); Wed, 05 Aug 2020 10:16:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17d0b5cba9394a41
X-CR-MTA-TID: 64aa7808
Received: from 6f9f3061213f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BAB69BAF-AEE1-4AAD-BCC2-D36D8EB272A7.1;
	Wed, 05 Aug 2020 10:16:51 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f9f3061213f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Aug 2020 10:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKHVkemxlQ9R6L3rZ65A+A300soiwYbEEqcYsBRFaixMJ0vd9tfXGcmkbm7Z6tiswmQmxspprOTlXvLme0Ip9mXn0Qlbv3q54c3zjl4ioRtVwPD56g+o7ajOGmTfy7Ki72YYeSnBqKGqrnjDSasdWbAxpNmw1kajjqPXYr9qGiEwIB0sKWuL0RXWocBqGC3WsX/QJRN2UOdFspe0YlRXWg+hDMbckgfW6p2sDkzObjfcu/gkDKbwH9+ZiD0ByFGiIvF7v+69JRCvmp11YSn9uQ7iYgPrmLfMlPJnyaJYq4VTUCmjBCEFDRY3nmtL2Pm+rr+LyCFnj5gTjLs5aFYDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjIyUctv67LbmqfY/D1F9DsIPt8FjM7kGIYLmavWhp8=;
 b=MdZXFeXYIFR1fpK0s1MgYV2vh269VP2y8HkUw0dyQmfRwFBOfpXQXEGGJi6gmjhDm7hashSQrQ10ZoSFFEAxucgWpfH9TmkfKd70BRqKKxQ1+PHYop2o4p9F4kLWy3LLlb3Jp08bkPsa7RDPeC2HYJOht2hGy20xhK2J2AujSjsK/RgqPx844M3GQ7rjasQRb6GYY7dp8JkYJHtHzIfbh9laRR832bvfTIgCFxW/n8YS8BkanrUHKcTvgmlgN4lp1N4ynHRmyu63h4akMFWfqzl1BnnOe5dIKAKYBITtATfnMRTpUwkorT46pOFnT4chmTXJrkqrZ6SRKRiZgzs4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjIyUctv67LbmqfY/D1F9DsIPt8FjM7kGIYLmavWhp8=;
 b=AX7yBuOIriszaDiUgOue7Cggis1j/7rbkwgyG+k9MMXFUr8WMzbAt1Myl+hti96HIlw1+oqJXj3gHdXgHy4NVY1gjcJXrt0Q7Mp0ZGm4HJUZJP/3sZ19K+fDnKxJMVj3Jrj4bv56Fo12alOcJu7COKxDln+AMD7igZY6iG41EZc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DBBPR08MB4870.eurprd08.prod.outlook.com (2603:10a6:10:f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 5 Aug
 2020 10:16:48 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 10:16:48 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>,
	Prabin CA <prabin.ca@rm.com>
Subject: [PATCH 1/2] meta-arm: trusted-firmware-a: add branch name for mbedtls
Date: Wed,  5 Aug 2020 11:16:28 +0100
Message-Id: <20200805101629.27959-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.52) by LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 10:16:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9eb01df7-6ad7-4e5e-3f40-08d83928b022
X-MS-TrafficTypeDiagnostic: DBBPR08MB4870:|AM0PR08MB3409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3409F72CE7FD0278928C0F82924B0@AM0PR08MB3409.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UrT1FncHc5H5DScPvNyTIbQZvx2DSgIqxMoFLpvhxlohZYn8yIyDO0HEY3maXWmgCS3qZd/037l8tmTHX2+HOx1EzydelwbH+D+SwAE+ICl5I7NMXtrqCQihfHmSE+KX0vVg878vSqQYvwbASRnZYjjPRBH/vgrvehx8xHtGnhg74Zu5wZZ4MqW1uksCfveF/W5ttyd3fp8jy0VoymidgW6e4D4zrYxye+hQhPMqT5pVsiXVqzHxteBN2FZBwQgtP4prtS6jYaWeOduJDgfvAKVp49hExMa5jpiK5A7pYAR0VeCX2huJT6nVlejm9Y7wcJI4OamVOfxV25PkhkROJw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(83380400001)(6666004)(8676002)(1076003)(4326008)(186003)(36756003)(26005)(6916009)(44832011)(16526019)(8936002)(316002)(478600001)(2616005)(86362001)(54906003)(2906002)(6486002)(956004)(5660300002)(66476007)(7696005)(52116002)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 xeyvc2+In1dFTXKM+EMaOzQ3M+Ex4ZzIWbX2SM3agBbPoC9a8Wd9DVn3uO9soRQVdOqnUMIM1mB2+WK9xUPDJBuif6atItPspgsiXr4H59kxS8fzlzhLKQPgAr9oKrw9+T5CFQgRV8iGwLRgl/JXeY7t/pyMwU7525MINSLwKcSDEmTrMI9Oh/RjAbexX237fsNgHMeas3u7ZYVyqt2OHdAiVPQ64Mb5/b1KQykgoB8RUk8ad9ByB+8SaXAjKDSap1xeUM7IuUBR6mWE9Mz06xCu3Tkv6Bs0cwr2PwrcHvgQD9bmD3Clk2ENnscmlyDG9q0APsWvCPktu19C1QM2d6EEgsJdXTeO/DIFmAqWoNkuliFMZt2vyDjRKZNQkScOTqRXqW5Rqc4C3zJvf8OX+HbCAwN+bzdO+vAyOVqr1k0TV/wR3s12iz2agbwXKvcBIH09lb2QC96pxKokeqm/arRcTtqmAyd4FjC/C7gBwn5bx2Io4LWgMQedOyI/A0jz2tDlvL28AL6R1Z7ezPIaIPlw9GrKYBvN4B+H4wKQoQUP5SPW+mUxomSZ0QVoHjNT2LDMMjOS36HmQtAMfP9NYEToQojnJWQ93/mGTxR0vbaP/ihVSmIRlU3ydS8UKA+toJu5QUQQt8OYYKXrWmEi5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4870
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2c0530c4-e516-4c12-c2d7-08d83928a9d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UyH6wijrG08xlDqWBlW6apE0Ap77Jc7oaU8GHN8MyzVKTc2fJDi2vOEt4xF1rA76rIVDXUBfNe1P1K0fAfQv23UC2JbHcxqRwhvfjk0VmNG9wWAUU26TgmUg6oWQd6KoYoJy/9MmDn+pxO7ED+4qBfch65h306EimzwaHTaj53V6Xcm/3D3yGJ/rKinQhLNpdYYsh3UenmmU3sYCErGOX1KChKOrz7fOrKXZPsh0tHLUwBilYmkHf//aZP9lhgvrkhiOKTZMjiizvmFC08ALib2Xk8nCoyzBapMKaZNw22Hofp0APkIpiM2TGtcZD0JmuWVvXrda4ybZW9H35mO5uu2FNz8N/Ra1lq6ykO1GAF1VE0PWBz62pySYzLQMg7+o7f8IJwKbuXitUSK7CXuHhw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(44832011)(8676002)(82310400002)(70586007)(4326008)(336012)(956004)(1076003)(81166007)(2616005)(16526019)(356005)(26005)(82740400003)(47076004)(6666004)(83380400001)(86362001)(5660300002)(54906003)(70206006)(2906002)(6916009)(36756003)(6486002)(8936002)(186003)(316002)(7696005)(36906005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 10:16:58.8241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb01df7-6ad7-4e5e-3f40-08d83928b022
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3409
Content-Type: text/plain

It appears that the mbedtls team have moved the SHA which
meta-arm was using from master branch. It is still present
in mbedtls-2.18 branch so this is now used.

Change-Id: Ie932f446067767e85a25583b1bdc02b4739e323f
Signed-off-by: Usama Arif <usama.arif@arm.com>
Signed-off-by: Prabin CA <prabin.ca@rm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
index 8286b64..7279173 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
 #
 
-SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.18"
 
 # mbed TLS v2.18.1
 SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
-- 
2.17.1

