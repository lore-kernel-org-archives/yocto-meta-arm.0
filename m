Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CE7C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:16:32 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.13544.1646327791258444073
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=TSjUNGh4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id p8so1649471qvg.12
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kin+M9MlJAfTpRJxVYvcrdDA7Rx8XmOZgr6/BvWCWGQ=;
        b=TSjUNGh4whQMFljJzalNvzH6AWFZBDHHJlMJ4zMoDn+qIiD+DJe+m5ceRO6hQTZaZ/
         WDO888KaUEizJzwNuhFRqhJk+YqOq40Q5VI3M+QFtmCnxiOdhm2NnuVgpHDrZ9NzHdmA
         jQ1ZIRooxvhhpqQvesHU/ac+tgoy76d36WA3OM57o7ck2zTdZva9sTs6ZdZF5KBbgemY
         TkBWEexhe5o/qsDtHiL8W2cUvviU/07fYB7vwEq+Efp3HjURULtLsbbDkCEo6gsWDARf
         D3MSnKn6lR2E1/8zs5cPb/8A15ugRaCWYsFFSWPVbsc0IQkarcN0hvx0EJ+MS7MUEfAr
         wqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kin+M9MlJAfTpRJxVYvcrdDA7Rx8XmOZgr6/BvWCWGQ=;
        b=EqJDHf/+d/u3XBPngkcOkFPLjQwzfaq2mnJGJh5QTZyk1hwSAGcibP3q8FL43gGalC
         QrsmWYJ6ZFicrnSfn3ZQrb+v8p9RwkF5tW5n0BQObiQPoJaTD5Btq69rHOOqMCUTQLde
         SrKVd0jHLA0VPDJyn9eMwRtaxUSEHNwpBRwsWJc57rhARuZp1oPncwW7tCA8eTQM8BYT
         Hxj46E5/LF3T37pU8dNyiwd04FYY1FHwDbimAIRdzXfrsWsDHKYdJKb4Hu+KkxeYevrQ
         Clg4Vx9zW44o8SYKwJT2b59HQE76FVYgg1EBSGOqgjI5rHPJl5if3Ph6MLkcx3NunIkw
         oUmQ==
X-Gm-Message-State: AOAM5329meqgceZqHDAue8gZgs76cndWJk2slGa2p6tRQNILlhmjLQ1J
	J0mgcBsuiNN51ESQUt9eRadgwXF6d51O2A==
X-Google-Smtp-Source: 
 ABdhPJyAfhRut98lizPqb5rzDhg7r1sSwyekYUjfODsClrdqK4rlFLA2rG3GjlYxm1IySpCx/U59hg==
X-Received: by 2002:a05:6214:401e:b0:432:cf83:ffe4 with SMTP id
 kd30-20020a056214401e00b00432cf83ffe4mr20934171qvb.4.1646327790226;
        Thu, 03 Mar 2022 09:16:30 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:cf54:5e99:f9d3:d9ad])
        by smtp.gmail.com with ESMTPSA id
 u14-20020ac858ce000000b002de89087e7dsm1800361qta.78.2022.03.03.09.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 09:16:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	ross.burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH 0/2] Corstone1000 Upgrades
Date: Thu,  3 Mar 2022 12:16:20 -0500
Message-Id: <164632778400.2165565.13244966932367346462.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301101609.40783-1-emekcan.aras@arm.com>
References: <20220301101609.40783-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 17:16:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3100

On Tue, 1 Mar 2022 10:16:07 +0000, emekcan.aras@arm.com wrote:
> Updates linux-yocto and Tfa SHA to remove the patches
> from the recipe since all of them are upstreamed now.
> 
> Emekcan Aras (2):
>   arm-bsp/linux-yocto: upgrade corstone1000 to 5.15
>   arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/linux-yocto: upgrade corstone1000 to 5.15
      commit: 81193d97adaf8be886c4bc6bdbe4ae73ad65b7f3
[2/2] arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA
      commit: 24db3b56ba1285e4196da9416a8914c5bcaf8fd4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

