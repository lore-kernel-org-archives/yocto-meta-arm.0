Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.58])
 by mx.groups.io with SMTP id smtpd.web12.18836.1594915617424105346
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 09:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=94JVWip1;
 spf=pass (domain: arm.com, ip: 40.107.2.58, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slCd+YOPuoOrYoDU5RJ1OH0ZMNs6HDrwsIKxmjcd6kU=;
 b=94JVWip1vh2bIPpm2j30kXp11d3XehDfVpWdNgzC630KlMF/C+/dAY2wwrbmLfB6byfgbAU9AzbPNdAcShctTiyOUkljvyw1HDpLzHo2ukKk+wpfsrmDbDkqEBjjv//eBo64gBMqCJ5GaZuYCK0rqtFthYZzXWF7Z4JI/wMSX08=
Received: from AM6P192CA0062.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::39)
 by DBBPR08MB4412.eurprd08.prod.outlook.com (2603:10a6:10:ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 16 Jul
 2020 16:06:54 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::d2) by AM6P192CA0062.outlook.office365.com
 (2603:10a6:209:82::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Thu, 16 Jul 2020 16:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 16:06:54 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Thu, 16 Jul 2020 16:06:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14e7455f2612ac8c
X-CR-MTA-TID: 64aa7808
Received: from fe38911516ba.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AB08C693-E897-4C7A-A40B-BCA2E9FE9B2B.1;
	Thu, 16 Jul 2020 16:06:48 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe38911516ba.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Jul 2020 16:06:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HC6syBaJosBQ8h55xsPJlb42bQfIjGAmBT1MxwnW1M2xtZ2RG6pK9KEEo/ahBQQoRQlQVx6eqE2asBLi+iNgFlD89Hrrw59exFa3ikdVk8CIHQV4YvnMU/H37mtxrYySLI0xnoPzduoK4ZyRgWqD4V2W4omnCr1pk6HJbGPoBn0CCbUiWLmnByEHFHLCvIWYai8VBwoC7QqC3E+gmF2uizIeYnTuCAVTacY7zfy8ddl41pifCzO2gGLl3VzI010sXfA0B5oQJeXDdgKNjqiuL4bMF1Bwcz+zlQK0Cnj0df+ivmG5rP0yliUdFPUFeOyT5WcEPlL6XnmveJlTMR/sGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slCd+YOPuoOrYoDU5RJ1OH0ZMNs6HDrwsIKxmjcd6kU=;
 b=moj6qIh2fBPd3ktSFyvsjCzhnhoiR0fSd4YsoF4Ob9s83ZcyPW9ulb/5Lko+gpI/b/aJG0rivDFwYpQT64cj/ZfCAyNLaq15neqpwkSMNQjKJLUrCbyJ7TjCDqek0uOx8o+wqlUt6d6uE7+ONzd/lZv/ZQvMqCxNA9Lv/LmpiWV6SDmlg3jHmo2sV92tNYIHoI0N3xlTExPYvGSVKUghnvTvm9xSFNmwu7nOL7UFSnD2k0DiY4vdig2vySLu9P1S/WvZ086QgIIz0YKUYtn+AoFz+Zr/4ALgEaVjLZQdJP4osu3NCt3l2gHzM0wEOty6aTnIeeBmgKPCEyd2e0Nkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slCd+YOPuoOrYoDU5RJ1OH0ZMNs6HDrwsIKxmjcd6kU=;
 b=94JVWip1vh2bIPpm2j30kXp11d3XehDfVpWdNgzC630KlMF/C+/dAY2wwrbmLfB6byfgbAU9AzbPNdAcShctTiyOUkljvyw1HDpLzHo2ukKk+wpfsrmDbDkqEBjjv//eBo64gBMqCJ5GaZuYCK0rqtFthYZzXWF7Z4JI/wMSX08=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM4PR0802MB2257.eurprd08.prod.outlook.com (2603:10a6:200:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 16 Jul
 2020 16:06:47 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 16:06:47 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: rename linux-yocto_5.4.bbappend for versatility
Date: Wed, 15 Jul 2020 08:59:21 -0400
Message-Id: <20200715125921.3460-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715125921.3460-1-jon.mason@arm.com>
References: <20200715125921.3460-1-jon.mason@arm.com>
X-ClientProxiedBy: DM5PR19CA0050.namprd19.prod.outlook.com
 (2603:10b6:3:116::12) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by DM5PR19CA0050.namprd19.prod.outlook.com (2603:10b6:3:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 16:06:45 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 15 Jul 2020 08:59:28 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1cac58dd-982b-4268-80e2-08d829a24215
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2257:|DBBPR08MB4412:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB44122CFAD56C1E3E53350B2FF07F0@DBBPR08MB4412.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 otM2JxnHdZ0wLr3A1KKaum5+zusZxDv40NtLrifzSp5Zbo/HLAhCs5Qn3dE8mjgPxyfGqBgYVERDKPxWb8GJKbKJ0gHA9kfIK0f/b+GoHTfQ7pHhtaLE/eHQGvuY7G81cjW1MoblYHqbzMQn+8/J/6a5l/52at3pQkiABPNnh3ZKNY1EBO2A5v4Uw8MZKcGxI7HhguMjaysOadkDmgGirKaciHdgyMcaCOLoWi1metwySdVuk9gQ+K5Qpfoxa0ZLiHTx8ztV8LU5FV6Dbf3X3zPnO8/T1YWRy6MC3CJ+v5tZsLbT91Lsw28IYg3CIXy4gLriWV9Hc30j/C1DnRXhSw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(8676002)(2616005)(426003)(26005)(6666004)(83380400001)(66946007)(478600001)(66556008)(66476007)(5660300002)(86362001)(1076003)(44832011)(42186006)(2906002)(316002)(8936002)(52116002)(186003)(36756003)(4326008)(4744005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 l3um8eDNSHEM1mOQzeJ3nTjD7Hzy3hBd7VFJ9DjOV+bA0uaR4nQqKVLdihCED3i7PDMuBO2Vo8R41mRW/QB8HznXJ8owXN8vpY/ZwFlTXWj0jI5tk/arY1h7eWkT4eI8f+16ZRJtQQFL7lEZByXwM9wDJFpxw61By8f2GX1pDR2N1OfK9dmUSAAsBp3rlc5OmU+Tk6YeMOrAMhDiEhcb0f8C6y16eQYUZuKpkcmmHQYebsNm10KdYKaIj/v6V80Td+lTUHgTtVaXebFea/VQPVuH32K3ZkHRVgkLeFq9EKWOm35zHKTvbQ4fLK9X1V4T91z0JgfDkK7+rH+Hl92tS7n2i08vqYb+xQzXtw2AsDgP6qthWS1Aci8XHziDxjrX41sOPGlUwz2NFxVEJD8FCb9HzvYhB0aKy6ySPyuGDW9jw+UgZpQZm/CucvT+4d7HdGwiPylfWyfrkTm7hZ0EVCL68i4oet9lIA3noG2YY6o=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2257
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(6666004)(81166007)(47076004)(316002)(82310400002)(2616005)(42186006)(356005)(82740400003)(4744005)(70586007)(36906005)(26005)(1076003)(70206006)(44832011)(83380400001)(8676002)(426003)(86362001)(36756003)(478600001)(2906002)(6916009)(8936002)(186003)(336012)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d9c30ad8-c11a-4dad-fe01-08d829a23d51
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+vnD4ph7bf2UqMNV9ruTx5ephBuiENLzmt2Mwaz5/kOBlJCGWGtVE0yYTXZQeLlx45xhsLmnSGFm3RMmymEZ4tP22AJiPGUJv6Cbr7yKzDN3GmaBog5PN81rjLe19kL3WCt20VvMKWpa/g1NHNctvs0gsEhUECrGOFdKyHyzmddvrB/cz5JHMUpX4hZgi443dbN1wRYBXcXGm2WBwqwR7axCaMgvFit7Sl/w8Mx7PLvTy30Ak2DHydER14azCBZdcGtnSSIYow0EG8dCA1uGH1JHxrBuAjJWFXp01Zicr2pkZbRjcTHhMouuscQM72F0p8joJMOZuqLW8iOO2l+1ihBv5ZwVBoeh2OfZ94r2Plr1l9ZX3IFqYT434hCOVscn2otqyg3MWQuz7ZTusQIOdQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 16:06:54.1942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cac58dd-982b-4268-80e2-08d829a24215
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4412
Content-Type: text/plain

There is nothing unique about the 5.4 version of linux-yocto.  Rename
the file to allow for this to be applied against any version of
linux-yocto.

Change-Id: I15e0c4509b237d29969105ac5942dd8079eaeee9
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/{linux-yocto_5.4.bbappend => linux-yocto_%.bbappend}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto_5.4.bbappend => linux-yocto_%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto_%.bbappend
-- 
2.17.1

