Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FD4C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:49:50 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.8920.1644594589093724624
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SuBb3Lea;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id b35so8595826qkp.6
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NzPb3qCkf8OTmHk8jdf3eom+e8cAdHOXTgiUieoHWwk=;
        b=SuBb3Leaq+YpGsMGPuVEWxAnRSc96TbcRCNYSJpSEzdjCZ3+YEi3U2qDPtu2oJGoDG
         cDFWTjQPvyGNcvnQIMXCtztnoq9k31MzAxgoUxfWfaDV8hx5+UUTKlWVqaxaSwGNBk37
         cM255lBLgPEcZC7OfWufZt7CCQYlDvgLWzjDcwK8YjAjiNbArvEWlyz3w7AyElXWSyYb
         6zg8/7yCqB6gkTMXmiphrwq1ThS3GNMh3i+qZoaKvB2ojRWJmFHja1FTYiuhEF0WskXi
         zgPp0D6msqrUMWJeqC8jprbAalc3r6A/5x2PAMyldpuM/5Sdav4GyFIA9gL0ImdYjBaP
         qOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzPb3qCkf8OTmHk8jdf3eom+e8cAdHOXTgiUieoHWwk=;
        b=SnjLwE7kbv2YZmJJm+vbz4qwwI6HpvjIJ9w7tfJ0ePv1JPviH89ZZVRHsXCaT5tQOB
         tVqQgqjCEzWeSqfC2AWxRjs9+RGh8Vv4XXdPGTeRf8Zs6Os6zM6+HkpZgHcD2XJu91gD
         m761c7DhmpbvNCOxysqXQ8GJor0tAoO+eXaZgdxoNlv8JkolJXoI22ynLFacPQaXcN3P
         akjlJsaQACYegW8KQyfhN7mVzaqSAdO0wLV7PmZBXr2b2YLiJAIQnVwCst8yYUajVBqu
         eZdC9Gw/xRyWlpYQEmDWl/2Ipw/KR+39eTz/NPWjDsp2OJTXOTOr8UeXyENWj2r6rT7R
         Lv4Q==
X-Gm-Message-State: AOAM533xkgdeRBFv84Ig7+g4cM1D1C8nQNbJk4WRGGikOW03YJyoYJcx
	3FrJYwUS1IV23rBzkma6tcAEzpklQkbqIg==
X-Google-Smtp-Source: 
 ABdhPJwuavkhioq8N8J6upT/6jMnJIMa/PC5mvmyL84ZxjGRYLsP/Vv0M7pcvJw0/dmQVQzazGcVwA==
X-Received: by 2002:a05:620a:7e7:: with SMTP id
 k7mr1081497qkk.244.1644594588126;
        Fri, 11 Feb 2022 07:49:48 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:6bed:1ee8:a843:e258])
        by smtp.gmail.com with ESMTPSA id
 g11sm13059189qtg.49.2022.02.11.07.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:49:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/5] arm-bsp/linux-yocto: drop redundant KMACHINE
 assignments
Date: Fri, 11 Feb 2022 10:49:17 -0500
Message-Id: <164459455940.4074336.18218659547855062701.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209174624.3824874-1-ross.burton@arm.com>
References: <20220209174624.3824874-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 15:49:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2993

On Wed, 9 Feb 2022 17:46:20 +0000, Ross Burton wrote:
> KMACHINE defaults to MACHINE, so remove the redundant assignments.

Applied, thanks!

[1/5] arm-bsp/linux-yocto: drop redundant KMACHINE assignments
      commit: c9e1f1fe25adfad4d358dc64db4d901ddfacf9a2
[2/5] arm-bsp/sgi575: use the default linux-yocto version
      commit: ebef5db57cd407697f7eaf89ee0802ee57388710
[3/5] arm-bsp/juno: move to linux-yocto 5.15
      commit: 0d0bafe7f3f5cc72f6b7b2f11cbd72cb80bf47f8
[4/5] arm-bsp/firmware-image-juno: remove default dependencies
      commit: 11b4fd20a0eec7cd9013f3d9d8ae550c64f5107c
[5/5] arm-bsp/linux-yocto: remove unused 5.4 and 5.7 kernels
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

