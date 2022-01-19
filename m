Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C07C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 20:23:25 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.2150.1642623804234703628
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 12:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MGwt8vBT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id bc19so3681294qvb.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 12:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hvw6JDB17A5V/dW+AJ4HZE1aWEeJNSXfMMcOqxU3BRw=;
        b=MGwt8vBTvZZtFyaiAkiUAk/v0ROJ54lBE+xzftlZrUy7NjuqmVu8V05t/JCycq0BB3
         s6/BrVRDgE3EJNQXY1TOWxKjvsc1MAUtYZXBk5OXjpqHBG5zERxE/0rmdp6MssdogUdt
         WMUvy7Mwtz6mDgLnocP6zaZrVG06xJI+vi1HXdkGBPN+z2fWylgpLyrGKwVE2b0vzii0
         uziYpwiwW262v9aO9b62h8rP+SzSOWmDupgS1e8ehWhHwapAF8S6JlPEfCoK97JwIC9i
         XTXXrA1iaOrr7/MdwZro4Rn3Wgc44TwpzWoKixfnBdl67VcXxRSlfFyhHHUDd8Dd0Aj8
         Yy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hvw6JDB17A5V/dW+AJ4HZE1aWEeJNSXfMMcOqxU3BRw=;
        b=CaCanekNG4AVJiWPny6eTUkOs1XtL4WSq2/s3/avPTAJvjUB+sfKP3scLImY0X+eHv
         sA4AftoWEbatHqU3/riQ99usvJBL8mlh43o3A6IQBzgZUZWuqBQ+ngXH/RTbX7734wrs
         OFbRp+FIyUPIo2yAvm9ywslgFEl75ANMn19LNryRHF7PdL7ms6TsEhhhC9BgJZ0RFy8u
         qeJHBh4XqGoZUuVnamH/QZh7yovsWTE4HGWR9wQ0Jq3lXhu7VgG2qlyoJj2uyDdGqrcd
         paR2Ja80PxgIB1exDElUKlrIf4gZIkvxtZUdiEVOGeMTBC0YYtO7juGqStPKq/LAWkN4
         aXSA==
X-Gm-Message-State: AOAM530G6ZjEfVpuuVJ+QJC2N8BshCBZgm8lIZmAdtL2QCx0qbC1ld37
	rXWVoun92ytw9xkRcuW3cngiQtk2pNC4rA==
X-Google-Smtp-Source: 
 ABdhPJwo3x9bP2i+A2I0xeT5E8EAOGYp8R5K1hXdHo2PIorTBSIUM2KYXK4FJuihe62vSHKPVH84wA==
X-Received: by 2002:a05:6214:20e3:: with SMTP id
 3mr15800313qvk.81.1642623803197;
        Wed, 19 Jan 2022 12:23:23 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:8193:15ba:db09:9342])
        by smtp.gmail.com with ESMTPSA id
 q13sm325191qtw.20.2022.01.19.12.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 12:23:22 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/hafnium: extend stage-1 mapping limit on TC
Date: Wed, 19 Jan 2022 15:23:00 -0500
Message-Id: <164262378005.2798275.9788902480563324711.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119181235.2780583-1-arunachalam.ganapathy@arm.com>
References: <20220119181235.2780583-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 20:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2869

On Wed, 19 Jan 2022 18:12:35 +0000, Arunachalam Ganapathy wrote:
> 


Applied, thanks!

[1/1] arm-bsp/hafnium: extend stage-1 mapping limit on TC
      commit: 763764dd2aa74d2f2af9502cce4b1124ae1322fc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

