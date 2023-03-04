Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D354C64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 16:59:36 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.12813.1677949175794744296
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 04 Mar 2023 08:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=sj7c4ec0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id z6so6360836qtv.0
        for <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 08:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1677949174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7TBna4QxIGTu3QeUoEqzR2nMjZmjSh0jyZi6nQW3Es=;
        b=sj7c4ec09hYg2GTseZHKTGtFezmqOQt+Gg0WJKTB3K4+GwusIIuHXVrfMmvTPOPmqN
         xkNos+BrUygAOnWW3HbyGc7+upHIDr7yVtInnxjfIp1XBBd5N6SBPpp300jV27OF/CFS
         01F0unCgOR2AsaLsXI4jWisKpMdjd+cQlSsMn4kMivoHkItqE8aoU2F9uF7nZ3Aj3+d1
         x/B9E5kVlhX6r8c1HmA3HAd0zlVHYlecjBxxWjz6M32Q2qTTQhqsQ8e+Mi75ttTjLDhq
         XVcq6GIX/dQsoD8Ck4vl+KiO1jp0paudWe2GC5XLfd6Cyh+X3aphED9FgT2xPgMh6zTB
         hECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7TBna4QxIGTu3QeUoEqzR2nMjZmjSh0jyZi6nQW3Es=;
        b=AFKyOtcsDyo8DfTPsi4hzF3I5ktFjkyqlmR7vjNGUAp91w56Tzj1gTkjVKFwZi9p/x
         4hgRmsJZlgrwDgc/Fvi7xqGKWu3nwriURZd4+BY8i/388Vii2PlrK3Q/YaOpYrBQlEQT
         aHn/iVqEfMs+wKyOYhGi09iFYIvt+QhTfMFIkpJo/6U03LQVW/RyPbx7podSXG0CN7Fi
         UfEPkOAHOv1H85cJ2M9srDt7rHm7M+QnhP4gDc4/N+K/04SyuJ0MuvJ5pjAKfk5Kg0uM
         +q9aMbGgdeJhjLUvGGHguGpP+s0rnirwomApTi91x+x8QkoOHQ08aj9De7OCbkaSt/tq
         queA==
X-Gm-Message-State: AO0yUKXIrDhsi6Acxur+LJ4Jo5eOMyWtDvqf0pKBAvnTIEKE25eOoZeB
	7DT0DD6HIrTa5l6JpeNF9PTKfKjjbd9ISxq+r3M=
X-Google-Smtp-Source: AK7set82qF0cSs2CxtSXdEO9/xoq3j46chfaiBvlH7B4YHHQoPt1B+lKpg62Ynvh+pcnyXuUEc8gdA==
X-Received: by 2002:a05:622a:d2:b0:3bf:e3c1:9895 with SMTP id p18-20020a05622a00d200b003bfe3c19895mr10635118qtw.23.1677949174449;
        Sat, 04 Mar 2023 08:59:34 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id 203-20020a3708d4000000b0073b8512d2dbsm4033244qki.72.2023.03.04.08.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 08:59:33 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
Date: Sat,  4 Mar 2023 11:59:08 -0500
Message-Id: <167794915041.51440.8945634153117640967.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230227165611.1337-1-gowtham.sureshkumar@arm.com>
References: <20230227165611.1337-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 16:59:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4470

On Mon, 27 Feb 2023 16:56:10 +0000, gowtham.sureshkumar@arm.com wrote:
> The UEFI capsule generated is in the incorrect build directory.
> This patch copies it to IMGDEPLOYDIR.
> 
> Gowtham Suresh Kumar (1):
>   arm/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
> 
>  meta-arm/classes/uefi_capsule.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> [...]

Applied, thanks!

[1/1] arm/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
      commit: 04071ec9f5091ec76da202ce610e256d8d347a60

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

