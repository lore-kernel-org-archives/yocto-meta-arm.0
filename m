Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94503C77B6C
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 02:44:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.45851.1680230676233053019
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 19:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Z5rWHMkU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id h16so13686467qtn.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 19:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680230675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sxa7TEjdipqtrunJgi9Pcp/IH5KoXUjSJlOo/zPpbh8=;
        b=Z5rWHMkU7EEjtoeZBgxDqwOxshSn4yrHtzHCa0M7NVkDHSrmaojzdJOoEFsV8Tw22X
         lhUvNodQOp49w2xvnOdORdhQPsgglqsxayR/5F9wY6iwaa3d4qZCJXSOYZOSxymBjC3E
         1jN6ai0QNtmDYPxkCXdtdUdffxmwgJ1viWt/kVmzMOz+K/rIU8Cw9Xa8B+uSXeMpaX0p
         dBDHuJgPVR/KFzkcIDORA/PJlGmI9y957G5qk1UTpt2AMlQ5Qn44AbtCHh7VPXvU8vKf
         9jp00bcsGTfhzg3i7T7m7et/Yl+FYT9MApf3RZq/9PIVx1BvlpEM0vj1ee0a6IzEtu6x
         0f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680230675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sxa7TEjdipqtrunJgi9Pcp/IH5KoXUjSJlOo/zPpbh8=;
        b=kE7/ElUYlUWHBm+pcSLTD5Akk+pK4rnBJHqDleKyPWOtwvtybq16cdG54H0Kb2uyU5
         69g3tPwhkLyF3bDe3iXgbsBdbbrnYJjrFd8mJKHpIlf+LAx3ttU1tinkiyTRXTDN6OLx
         xiPCP7t0XWfEy0xVQJKFW8VyN+DNlWBG2OiTIisdRAjUdyLsH/uCB2gpL22hxcdIvxnC
         NCS5zqcmZGncuWRNHtmQYE7fFatbVZ0jpQNSAd9sluLunOrWlPXGXTqIvEo0IDmRPi7T
         I13PW9/D65AnUQgX878vD6PnOWlfi1LlT6GPccqiPz1Y88M/YRgVbebu2i354XuoSjmF
         sCxQ==
X-Gm-Message-State: AAQBX9ctLpm9kmwvXmoAm2Fn7ko5RCNc9zbG4MPVvuvqvzHpRNKGy3Yn
	qlRXt9FaBpKnabMEvKRe+xMGpmV0Sm62HG2Sl3U=
X-Google-Smtp-Source: AKy350ZFkZtS9D4JutYBkoXW9AKuWRVjZ8WKPf27oJM14/G7AMkvB7JPI6N6gdgROlTo4sXTV/0qgw==
X-Received: by 2002:a05:622a:1013:b0:3e4:e6a8:89ed with SMTP id d19-20020a05622a101300b003e4e6a889edmr28814685qte.62.1680230674881;
        Thu, 30 Mar 2023 19:44:34 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id g26-20020ac870da000000b003e3918f350dsm314267qtp.25.2023.03.30.19.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 19:44:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] CI: add CI_CLEAN_REPOS variable to allow cleaning the repo reference cache
Date: Thu, 30 Mar 2023 19:17:14 -0400
Message-Id: <168021823621.3450077.10549465501916249740.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230327165214.3508587-1-ross.burton@arm.com>
References: <20230327165214.3508587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 02:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4519

On Mon, 27 Mar 2023 17:52:14 +0100, Ross Burton wrote:
> If the repository reference directory gets corrupted it's not easy to
> wipe it, so add a variable CI_CLEAN_REPOS that if set in the pipeline
> will clean the clones and re-fetch them.
> 
> Also, stop the fetch from detaching during the garbage collection, just
> in case it was a long-running GC that got killed that caused the
> corruption in the first place.

Applied, thanks!

[1/1] CI: add CI_CLEAN_REPOS variable to allow cleaning the repo reference cache
      commit: 2db12df861fda0896f196a101572d6300bb4cc78

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

