Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.68])
 by mx.groups.io with SMTP id smtpd.web08.24008.1605872711244982605
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 03:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Sk/ys4QQ;
 spf=pass (domain: arm.com, ip: 40.107.4.68, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXpkWZ+U9jaXf+sCO0pTyLK71kLY2b0YZEc7xvY18tY=;
 b=Sk/ys4QQL8khOdxgdswKfiMHwC02KWs0idKqJywyeTPXFfq4+OFNC1BfWSjbkD7+Id7ly2FUs4o5tj5hRph0wFw0Vf5B5VY9zgLSAJCT405TlRZfgTKvEqOOIV1gDpQQfEzvhYEHP9uZuQvtlhvYO4h7nf5laht0Y7WVcys1eVU=
Received: from MRXP264CA0045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::33)
 by HE1PR0802MB2555.eurprd08.prod.outlook.com (2603:10a6:3:e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Fri, 20 Nov
 2020 11:45:08 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::34) by MRXP264CA0045.outlook.office365.com
 (2603:10a6:500:14::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 11:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:45:08 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Fri, 20 Nov 2020 11:45:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06a7032293f2da62
X-CR-MTA-TID: 64aa7808
Received: from b91475eb61ac.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5629DA7-8E92-4AB5-9B72-DDDA07D6CFA1.1;
	Fri, 20 Nov 2020 11:45:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b91475eb61ac.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Nov 2020 11:45:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSI0Fm6bvMHGMYf+WURQyGI4ZpzBTw7zpqqw8u2yii8maKxd6HGmrP4sYE8KZyiATl9hCEpmZaDooryrDirH/eqt0ua79I2w8nu+sRB+y9xUPe9WxRtkfkoVZuxtyPPcFC14iD97Pq7K1cDW6rkDJ5clejbmRVp0GypMPY5/5bxTiJJNCbr7djrRO60OauFm9RCbA30xY8HMye8m5CIw8fnjYVELVDNAb0FT+qDUjTiU7IAc2Egk7H0cBSObIJ+k/WFCPc6eMoQFXrYZL0PHuOTzCyt21XT3XEiEmZQcoeQpqFCB8XDGcRomLY4LPj19yoGS8iFJRHKGqN1IkoMgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXpkWZ+U9jaXf+sCO0pTyLK71kLY2b0YZEc7xvY18tY=;
 b=NmdEHdcOh++1hQD8kIrc4D49KFFBRN9+hi4bXMoeBD7zZ5FOostJTyMx7cPtnZYpANl4viQtm5TTD8151+74Hpdit7M6PH7V7bYw0q5oGJWXafEe6FzNBZoQuCSaML3CpxUVIiNhntUGqglU5peaxLUsNXhNbAgHqUuMOwQ5Xj7fDngYWGmHTkmhGjSvxCjJJ7rSfr/6V3whRfOkFIl/gNhPIjXPuSlH7ULxF5Xasy7GEolzCgNhJ13pggmT9YyyvtHUYA1Kjiklk9F+IDPnVCj2bt5wobQ7SqiJQblJeGoFaaE8ueB+ALAIHgeII4LW6w24bYe0AbSH5L0b9o6mqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXpkWZ+U9jaXf+sCO0pTyLK71kLY2b0YZEc7xvY18tY=;
 b=Sk/ys4QQL8khOdxgdswKfiMHwC02KWs0idKqJywyeTPXFfq4+OFNC1BfWSjbkD7+Id7ly2FUs4o5tj5hRph0wFw0Vf5B5VY9zgLSAJCT405TlRZfgTKvEqOOIV1gDpQQfEzvhYEHP9uZuQvtlhvYO4h7nf5laht0Y7WVcys1eVU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB8PR08MB5018.eurprd08.prod.outlook.com (2603:10a6:10:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 11:45:01 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:45:01 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/5] arm-autonomy/xenguest-mkimage: check if partition fits disk size
Date: Fri, 20 Nov 2020 12:44:02 +0100
Message-Id: <20201120114404.730-3-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120114404.730-1-kamil.dziezyk@arm.com>
References: <20201120114404.730-1-kamil.dziezyk@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:45:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8fb378e-500f-4346-5c1d-08d88d49bb33
X-MS-TrafficTypeDiagnostic: DB8PR08MB5018:|HE1PR0802MB2555:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB255555308873A07BD9863CA6FDFF0@HE1PR0802MB2555.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:525;OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ArreQ+LwbzorRr4K1S1eS/N7EinbFfoadPfn/pp4mX72UwapoykDa7eiXKKSVyIMjBHrD6FcAnpAuejCNfdLzOJnJJJ7zwDLRwnY67nGJX4FxhNng/8gfCxdbuTcBH7n6h/Je+chWR4Ta74ZBm0uY6GbZ82SOV34gNXJhpGNqsZZwewC/VB9RbF/ntKR1iU1rg/8J0p654/gsaxCK2QElhoUu+C4TwkTF5h8ECAMdAWqmEkOERJAo+lyGyUe0rCkNcnkyaWxRsQyn/XZOEiayykxSipN0M3Mby91JuwgCQGt6BAwTWi3ZvQ/H5WHOq3s4yuUgwGkjqDzw+v1QOByuA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(376002)(346002)(136003)(316002)(6486002)(44832011)(6916009)(83380400001)(2906002)(478600001)(186003)(956004)(26005)(16526019)(8936002)(2616005)(7696005)(5660300002)(52116002)(1076003)(66556008)(8676002)(66476007)(66946007)(86362001)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 sCkWBoS4imn9m0CD3kOM/irc6PsCDuh1Y+duOcNwNjeLfD9nloi2ss+v+1OShrjZCE0HkgAQ1/LIzg4V68QhlNjtBoxWvrqlXftLsvlOPWDuMzIQuCL7XuW1VMQGU4L9hCg0Lt/dKs3kMrASFh38B4GxVWLGP6lz8mnkOJKnu2FF0yJCyqbW0V6VM3w7UnFOcdZMtv/84PNx2/UAs9n7/GhJ0lpI6MYujy0Dzbqzb0k5KR/IRuft9Q6xg4vqp1LwlgFdBznHCPO508DBidyQvbC3ebClfQDYMio24SMdYxXplLSBJ1PJHeaseoPZ/Ng85l4RPLVmxggzGjCOwMWcJdo2ssuWAlJxaOVkADt7NyUAmNWK5XLDxn5Mh0PL6YMSpfZH1Cbvt8p3+1zUOFkQw8Y+OnsdIXW0e3wp0k0qAC72Dc4PIg4dDAZB78YfMXcmqIEl9Y7bfdroePjOsjAbp35ZUFZ1cmr/MKOdzh0UDOMoo5AysuFixqH6AEI2Siy4RQDh5R7ThSmaGcY9z+8Yy9s+8aOwxMZfPLsUTLLf/b+3XVtU5YZ0WDIo4UJytoAujF+i2kbIL4dpucuarLYp2AEUsN/+YFKdnnSKHzcTNQYroBXRbSKOLfjbEhyoAX6gaGYHg73cU+SCcEfq8N1UWpLU+ACSTuKjB6yeScRqA+cu6ZBws6xL7UiGmL4tqRXiFK5WQP1S+RXtiIV6UuHUD/Ku6x8TzTkjJMwhxsykCG891EC5U+XeKAU3zzo4V2t0U2J9yBqHVj3F8HUaxp0SFeWCzwIiiR555U0UlmwEKJdF1+VXaONsMozNivr3udPAgBvnhJ7uI3lat3BwYfdogasCiqJcx/uAXPLIGWJuF8o0c99LoijeApE8SbGItBdmX5lu9+HUozvBW1sMPNPjvw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5018
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	89a5ad4d-2f69-4d1d-404d-08d88d49b6b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A+b6vMPQBJR89b0pDXESULXSukJQDn77m1J3rM3LUAsPXNCUsVM0cv/GT5w/Y/BW/NlkzF62TGIDXvkh7dpJ5d7n5vEJLIv/KBH31cZysPbebn3OqewcN0gBSC9OcubU+Hn7JDCtWFWSEtY0d/6Lax19DTp/6GZcp4jFDH6j11HWm9KDsp5k1mQEf/5Sdus/e8CJalOEGeFeCiwnSBW5ZQyXLnuCGVHWAMq6L2EKE6zY0lJeJfa2B+eEjJ9khx8fLGgIz86e+RtogQnhiA33PTzPSfHtC9AM04DT62U0NAbYCNqzV7dfjQT0j4YOCaS5MGQ2PHBbqHl3kwZ8Uu7yV31dIkWZ1LFYBKKzEchyO1uOjzxWgcLrLMZflpVgrCZ88DpQiibyYefY/8+v2fDN9A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966005)(44832011)(82740400003)(316002)(8936002)(86362001)(2906002)(70586007)(83380400001)(81166007)(1076003)(70206006)(2616005)(6486002)(336012)(47076004)(356005)(36756003)(186003)(6916009)(82310400003)(16526019)(478600001)(7696005)(26005)(956004)(8676002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:45:08.4480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fb378e-500f-4346-5c1d-08d88d49bb33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2555
Content-Type: text/plain

Check if partition defined with '--disk-add-part=*' will fit
in disk size defined with '--disk-size=*'.

Change-Id: Ide87fe541d050497b4f2e5b5b47c1bcac8f5d37a
Issue-Id: SCM-1515
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../xenguest/files/xenguest-mkimage           | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
index c133e0e..8543c01 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
@@ -412,13 +412,53 @@ check_size() {
     exit 1
 }
 
+disk_config_get_size() {
+    disksize=$(echo -e "$( . ${IMAGE_TMPDIR}/disk.cfg && echo $DISK_SIZE)")
+    check_size "${disksize}"
+}
+
+disk_config_get_parts() {
+    echo -e "$( . ${IMAGE_TMPDIR}/disk.cfg && \
+                typeset -p | awk '$3 ~ /^DISK_PART/ { print $3 }')"
+}
+
+disk_config_get_free_space() {
+    disk_usage="0"
+    for partinfo in $(disk_config_get_parts)
+    do
+        partsize=$(echo "${partinfo}" | cut -d '"' -f2 | sed -e "s/:.*//")
+        sizeMB=$(check_size "${partsize}")
+        [ -n "${sizeMB}" ] || exit 1
+        disk_usage=$((${sizeMB::${#sizeMB}-1} + $disk_usage))
+    done
+
+    disk_size=$(disk_config_get_size)
+    echo -e "$((${disk_size::${#disk_size}-1} - ${disk_usage}))M"
+}
+
 disk_config_add_part() {
     partconf="${1}"
     partid=$(echo ${partconf} | sed -e "s/:.*//")
     partinfo=$(echo ${partconf} | sed -e "s/[^:]*://")
+    partsize=$(echo ${partinfo} | cut -d ":" -f1)
+
+    # check size "ID:*SIZE*:FORMAT:CONTENT"
+    partsizeMB=$(check_size "${partsize}")
 
     # Make sure we don't add the same partition twice
-    disk_config_rm_part ${partid}
+    disk_config_rm_part "${partid}"
+
+    # check available disk space
+    freespace=$(disk_config_get_free_space)
+    if ((${partsizeMB::${#partsizeMB}-1} > ${freespace::${#freespace}-1}))
+    then
+        echo -e "Not enough free disk space(${freespace}) for partition "\
+                "'${partconf}'!"\
+                "\tTo adjust disk size use '--disk-size' parameter"\
+                "\tor shrink the partition with '--disk-add-part' parameter"
+        exit 1
+    fi
+
     echo "DISK_PART${partid}=\"${partinfo}\"" >> \
         ${IMAGE_TMPDIR}/disk.cfg
 }
-- 
2.17.1

