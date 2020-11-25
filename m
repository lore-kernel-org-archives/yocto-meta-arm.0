Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web10.4445.1606295796942134917
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 01:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lzOSpNGH;
 spf=pass (domain: arm.com, ip: 40.107.7.54, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI6wLz9hfdv3qRvhZogvk0h2Xs6gzBXdz3ymSs5uUvo=;
 b=lzOSpNGHTYEbDcyol9F8ETT8hyO7Z6pkzXGl+aqyyrV5iI31swnMefDpH5xq88h+VfJsEjKPkRX0h3PnSgdGkX67at4aWdvIkjakaohWEeJtvwlJPB4jZBe9kc91u32NyjKx6UbNGiicKqCppCuC/ReHqbN1ycoqC1/SLeXp6oo=
Received: from AM6P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::26)
 by AM5PR0801MB1953.eurprd08.prod.outlook.com (2603:10a6:203:49::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Wed, 25 Nov
 2020 09:16:33 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::37) by AM6P191CA0049.outlook.office365.com
 (2603:10a6:209:7f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 09:16:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 09:16:31 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Wed, 25 Nov 2020 09:16:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7f429fb040efd668
X-CR-MTA-TID: 64aa7808
Received: from 0e631a4e041b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EB42C8C0-7F80-4E8A-93E6-517D6BFE05CD.1;
	Wed, 25 Nov 2020 09:15:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e631a4e041b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Nov 2020 09:15:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnN2eF0t/VsaDIV4wadDo7bNYE+/rxg3LfHPYVbCH5w2cWICpfeGkmz7QawpVl2UMDh5SjiQuopSubsgfF5AYAx/vKfpqPp+L55U84UnHHbQMGd2EvEUDwIdsxlRk6pKNgWzQfQXOCo7VuFoi0HpgSNLjJ7XEGdBgfYVOYGKmQmObvyU934BkcJ+46z3jiyrVack3S9K2Gs1qrrOZqhIkKvu9HUATC2Sm+MdZRHQNrct54W2NBXR1SiNHjev8TRuqJcmODwEe6EKU9+6oNtZO+sIUShjsyzY8f/MB2ZUUj8OcQjC23dswAmN02dAFWj3bAveP8xAqp1Yf0a6fUIU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI6wLz9hfdv3qRvhZogvk0h2Xs6gzBXdz3ymSs5uUvo=;
 b=IBLs1f04A4Gtzs1O5e29mOOveR6jVyhvVIXDYP75CIctWHv48fUkR1rKTkbDT0GbEsbnaWca4CAkW1NSuXFoEuGASzrJzIlQdKLA1iYN4RnLxYSjkLZ8gR+5bMjlXM4dqjOr2Tko2K/9tkj9S9Bh3QNQrTECgKmaaUcK4/L73UbfC8LvxwgisXiuwxR7pd5gI7E8PhZga6P3W46yoTRQCts00c1cWCldawXlCY8XA0k4KaZmAaKTZaVvtWYev/QhaH2A14ETOQZTANUntaiqdImK+n/2qpVWYYQTyKzKf6wFvGCl5jtzVkxjN0aoyaEWCfFmOiv0pjP+Y6JcglX3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI6wLz9hfdv3qRvhZogvk0h2Xs6gzBXdz3ymSs5uUvo=;
 b=lzOSpNGHTYEbDcyol9F8ETT8hyO7Z6pkzXGl+aqyyrV5iI31swnMefDpH5xq88h+VfJsEjKPkRX0h3PnSgdGkX67at4aWdvIkjakaohWEeJtvwlJPB4jZBe9kc91u32NyjKx6UbNGiicKqCppCuC/ReHqbN1ycoqC1/SLeXp6oo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PA4PR08MB5887.eurprd08.prod.outlook.com (2603:10a6:102:f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 25 Nov
 2020 09:15:52 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::e8e7:483d:766b:3bab]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::e8e7:483d:766b:3bab%4]) with mapi id 15.20.3611.022; Wed, 25 Nov 2020
 09:15:51 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2] arm-autonomy/xenguest-manager: Fixed subshell false positive
Date: Wed, 25 Nov 2020 09:15:45 +0000
Message-Id: <20201125091545.7950-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO2P265CA0347.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::23) To PR3PR08MB5785.eurprd08.prod.outlook.com
 (2603:10a6:102:89::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.52) by LO2P265CA0347.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 09:15:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1889baba-8d06-4efe-110e-08d89122cc33
X-MS-TrafficTypeDiagnostic: PA4PR08MB5887:|AM5PR0801MB1953:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB195302241C37DBBEC09BCAA98DFA0@AM5PR0801MB1953.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K+OmUQaZzMY7vERj2HouBihq+gAyH/kv9wFqhr56kb17VDIXy7gNcQLznHA36TzdbPVk8yH5chaJ+VabgYCNCdNqZoAH/G7UNM+MMtdgap4qP/yiOBtjS4fn1n8knyWe7/9+W/iYphTCABX75G2UHm12+WeVRBqp5/toGMRuI3CWgFhUAqQeN7s1hlkmnZUgQVNCM27qNKkJu6B/VEeIxmStdnEkuE/EZt0C92TkkzeIOGtY2/iRG60k1g6ZR5oQ+wSvJLgUhpq98a+vZSzEXlXNNFjiKlzXhQhGsNZrSUXX5MSOLA6/MnhDwxok3LVjDUKWeCuUnakYp/ETW/AISA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(5660300002)(16526019)(6666004)(956004)(1076003)(26005)(2906002)(7696005)(52116002)(186003)(316002)(8676002)(6486002)(2616005)(86362001)(66946007)(8936002)(4326008)(36756003)(66556008)(83380400001)(478600001)(66476007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 qVn9hdF/+F9wx6OlMCF1UW0gum/VFGwDL0lzGDPANu9/Ul2RlFxmtTT5Eh36w/ASaRh0/cymJ2UCmefzoXW7Rb5hAK1TvY12y3kxiqQ8lvWcAlcbmmnQsYMG2ISmd+nfaf/n6w43wR51g/hf1iDYBWWtB66rckBddP3TOwqAD7UQQxRpFM7NbZRfrnQu7nRKkTw4Dhot5L8Y6FolVdghD9uWsLV9f00abd47dFmyzlMTT6No5/AdiWkhzRlXH99nlQELUxjLTT2FYqEqovWoGpDwOvarRxIY2pjOfUwp4uZZvr74kdlQIZug2RJgfiLlI5GG1t9tT/3+ChKdLrE4oYx2uw7/iiybteS7HhMxjMEZDHA6RdEpxNpyfj6dkTXiVZdhnBZzslgQQH4uBD8jiw3JH7KdaIb5zsouhU/FeTKboXWLn2vScTxBJHovL2K9AP9FrrlpO3shUvl0UZdOy6DUVjxq+qtMaqaLXiwXiJtMNGT+B4ZLXqpFROv/q4w1mKSb4FJSNKsI77oQ/OocwHsZ0XUeLXcTNeRJ07VgLD+JT9pXRnzHei3i6QSRT86i0/NPEEz+DJepui6D1xwRpnRYf/3qcdrFbBkN+aioVE32bEk0f7fQ8Bki21pKO2d503PkiyZsJ7yRgAQY36z5LOvdJ/z1sd1Erir6QISFo/fQBm72MolJIvQgOTTSp6KVSxkyj0dbnxkGfdg80wD+/LYBVF8K3Qx29SEmexEBx0VQhyQ2JW9s0DSYAyAqNWML9okXGxam9s/LIBAh49AbQBQLUmUNZhP8mmwYoqsxt/j0lshpKUIjSYuyDXV0hP/zUdW64IbWr8CL3FoWtmIrpPIBjaGBEXelf14EX5iVP6P7pCufCeFLOrLQ+x2XfhpBT9ImLU9LXMfQqCuLKm2/0Q==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5887
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	08909ad7-2d80-4c2a-1413-08d89122b497
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BF3ZGnxSH8QVsxocQ0Wii6oi9Tn80zTvuBbJLER05ec+KdyK+weBW9jNeMwY5/7026rk9EVLZf7xBDtkqMn7cQdvvx8q3ZLNh2krIbDF6MGPTa0PnYF36lKj7ylaNmrnzfTSaWfF9zzoFvDweoxXahk0xRU+vlNMU+mlBF5SyXwfea02GEnVzt5uhpsBuG+iIBT2wxH+unQdNhEbEm/rAbLibsBns+1wcnBXW18WBk/XQPr38tsyJ1hm4e6qHqPp5HksO2QR1kgwkBoqrCV+o2+sAkajoE59IG9BlrEZlT8UOrUnS5q/Bn9P2zeI7Y97Zo9GN+W0dmWvpkyvNHPtSiM5k9JrXqQ7sHC6erPN9JHs6MLoTMxi9WB1lDd6mjj6ulT3Ky7ej4bPQgjiukMwFQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(70586007)(6916009)(5660300002)(6666004)(2906002)(1076003)(4326008)(186003)(16526019)(70206006)(7696005)(8676002)(8936002)(336012)(316002)(956004)(26005)(86362001)(356005)(6486002)(82310400003)(2616005)(83380400001)(478600001)(82740400003)(47076004)(36756003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 09:16:31.1360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1889baba-8d06-4efe-110e-08d89122cc33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1953
Content-Type: text/plain

Removed private check from check_size and is_integer to prevent
false positive error on execution in a subshell

Issue-Id: SCM-1623
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I57564bf610e21244c963a77c0669da5d4526eeff
---
 .../recipes-extended/xenguest/files/xenguest-manager          | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 33ec40f..cc55b26 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -70,8 +70,6 @@ function check_private()

 is_integer() {

-    check_private
-
     if ! [[ "${1}" =~ ^[0-9]+$ ]]; then
         >&2 echo "error: invalid number '${1}'"; exit 1
     fi
@@ -80,8 +78,6 @@ is_integer() {
 # check size and convert it to MB, e.g '1[G]' => '1000M'
 check_size() {

-    check_private
-
     local disksize="${1}"

     [ -n "${disksize}" ] || disksize="invalid"
--
2.17.1

