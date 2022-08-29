Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D81ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 18:59:09 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.2309.1661799547774452071
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=58g4Wnl0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id s22so4280615qkj.3
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=xr9J4B0/y9AOZr/JYviztluT3b5nnxt0ndwDe57pINY=;
        b=58g4Wnl0wtcTX7eOqMXcSsiSRLKj56BuwmmkeyFD1jIAfMXsa29hh4gyLT3CFySna1
         MvApSWiuT+SEhuLSqFkt3RKc0bkdoeVghKHdYftfJGtUhR3JJJlgUHCK1LkqDzefaoVi
         /kajIxj2gwFouCuDvdqlu9n7dncsA6wftQ0zEB72PA3/kv6whzt3tenr5szOTUlVXlqY
         vpMvKl9lypr8UgqWqjY7stTTXbrET7udrhKX6R2OKvCebuH6kB+kmpupHb46bI5kSOfl
         7EbZMXudtp3msjZ3Ve86bXMPEcCpMuvLJDJn7fjy+LXXd72DIHHFJOhkq82TRWe3Yb3Q
         t4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=xr9J4B0/y9AOZr/JYviztluT3b5nnxt0ndwDe57pINY=;
        b=cNsdZ+1eWJ/IyuOrfCOYgcYBD7+gdBLGM0daCuTfBwcE6f4xMvXluqhXZ7/DGIQbCj
         5mHNGfR4KwjZLgUqVjBH0iXBZaGDL+bZVgHAYOYARHhwTQNPsXQrpnJB3RJGNIyLXGVx
         9ub31S5kZvjd9KKgrPl7BXp4NnTEYi+0EjzO2X79rMSfI5pUTcajBDGimtwFSjCAxKkq
         YEWBalv0SGmSbfQxHGsK0CgAZoFVPh8rifknAJy1H8azQJ7Cjkp0NyXFmbxjtmLDWSr6
         SxZ2py6CYLHHyqVUBNpDu46f5SwQYkH914NhF0YlKpqe30BZKoGmhGPoirhiiBmCf4bo
         Nptw==
X-Gm-Message-State: ACgBeo0JKCHRWKQ2IQ1c3fI//mcuRiGAZCI0bPBP1QzkXIeX6gFRLLo7
	q0s1H6mtFV21sHlrVPwooQ196rAqXQo8LB0N
X-Google-Smtp-Source: 
 AA6agR7kyYoOi3hhlVEnpTWGUP7OH/MHnLStuhN51S8D7vkhfKMyGcHef6c8z0V4sCsq2oSNoWum8g==
X-Received: by 2002:a05:620a:147c:b0:6ba:bda8:3fbb with SMTP id
 j28-20020a05620a147c00b006babda83fbbmr9274273qkl.33.1661799546354;
        Mon, 29 Aug 2022 11:59:06 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 d19-20020ac81193000000b0031f0b43629dsm5593634qtj.23.2022.08.29.11.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:59:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] arm/optee-os: backport linker warning patches
Date: Mon, 29 Aug 2022 14:16:19 -0400
Message-Id: <166179698237.462911.5012793527817562062.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826095008.783707-1-Anton.Antonov@arm.com>
References: <20220826095008.783707-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 18:59:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3721

On Fri, 26 Aug 2022 10:50:08 +0100, Anton Antonov wrote:
> When building for arm32 with GNU binutils 2.39, the linker outputs
> warnings when generating some TEE core binaries.
> 
>  arm-poky-linux-gnueabi-ld.bfd: warning: atomic_a32.o: missing .note.GNU-stack section implies executable stack
>  arm-poky-linux-gnueabi-ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> NOTE: recipe optee-os-tadevkit-3.18.0-r0: task do_compile: Failed
> 
> [...]

Applied, thanks!

[1/1] arm/optee-os: backport linker warning patches
      commit: 38daf1ff8c7c0209d3392484d191bdd2f4c81514

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

