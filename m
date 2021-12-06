Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79186C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 21:58:41 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.58666.1638827920351663654
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 13:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3DRgr3Jd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id b67so12692839qkg.6
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 13:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FAp6R7ZZVgxv0IlmqGlaJnZOTBJzyJ+Cc7JRJikWI/I=;
        b=3DRgr3Jd/eyUcgSdg+ltCE6FBDoAYYeB0r8GPFuwUFRGtGjojGonAyr0TbI/tg+1V9
         4yCVTNiwAp0IhhKahjxam1Mmoi/X+IqQnABBQpLULSaIes6P1DfOp4yBh4ovi05QEyEQ
         emePIFdRPP+D5J/70jCp2+oTSah2DEiUt1N59FqOCfpQUVWS8+zpJyaZ9I4RLywMBrH0
         v5fkrAtNWfS+ef8Xql/JywQA6Zw8wYsbp878978uCwFCLKpfe1Zru70uLqTvIW86qDES
         Y9f8HkPly5IMhodXatMA6ZqV879MfOGrXMKNptRMbf8yCNt38QiE+5VmGXbxWHCNz6ea
         s0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FAp6R7ZZVgxv0IlmqGlaJnZOTBJzyJ+Cc7JRJikWI/I=;
        b=qDWGAgcoHihGtaYSWrmYClsu5nXSSDbsNW2rI21nt64k6FRpv5UMAAGT3lM7l/Wwqv
         bxMqOfAdcfBL5/AeNPLQ4oYQvmkj/TdYlkG9bW+uFwzXMG7DQyee3Vv6jGchGKs1SgeE
         fCAPxw/0ikRE2Q83buDHtIYuoenYHZpRjPoTAgYlZ9RNAA6QP3P9epqnwSz3JnRdDxi8
         BQpRuwmabczsSRMcq4t3rcv9Vkqbnq9M5I8iGfo16itOkuHCHCgOIJ0tUPoPMy6lFuL9
         osXsdvBYr9NlaMDUODO9X75UxUWMtL+teEpD/KfLll2uDdtqKvTXqSBTPA1FpYoru5Dg
         o88g==
X-Gm-Message-State: AOAM533/UStmZhU7K1MBE7UNlJwES4/x+ZsA8sleZ+ZJBdc/bhEhmhqx
	NN4BIretYNuMLmrG+t0mzQk2LOVjxVWmug==
X-Google-Smtp-Source: 
 ABdhPJxGbpGSCMPYQEkFGMuHEFKZnCj7MMq9Lk+Pz2EkWLjeXG6VSGXtPxCGzql45HgCLRP0B88FVQ==
X-Received: by 2002:a37:9ec7:: with SMTP id
 h190mr35587066qke.700.1638827919414;
        Mon, 06 Dec 2021 13:58:39 -0800 (PST)
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 u27sm8889900qtc.58.2021.12.06.13.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 13:58:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] ffa-debugfs-mod: Pin to arm/aarch64 hosts
Date: Mon,  6 Dec 2021 16:57:58 -0500
Message-Id: <163882776940.28346.2195014743380088603.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204015347.1195034-1-raj.khem@gmail.com>
References: <20211204015347.1195034-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 21:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2552

On Fri, 3 Dec 2021 17:53:47 -0800, Khem Raj wrote:
> This seems to be needing arm specific kernel headers, so I infer this
> still is arm specific module
> 
> Fixes below error on non-arm hosts
> 
> /git/arm_ffa_user.c:12:10: fatal error: linux/arm_ffa.h: No such file or directory
> |    12 | #include <linux/arm_ffa.h>
> |       |          ^~~~~~~~~~~~~~~~~
> | compilation terminated.
> 
> [...]

Applied, thanks!

[1/1] ffa-debugfs-mod: Pin to arm/aarch64 hosts
      commit: 18a0b35ad2b8cce9cf01e1ba78aaf38084636021

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

