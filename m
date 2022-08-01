Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BD3C19F2B
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 18:02:45 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.690.1659376956149548327
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 11:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=rqG9LJVk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id u12so8681409qtk.0
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=dSXDJtPMtY1JFdr7NCmRAELFF/be6sRkfQj2+URQSm8=;
        b=rqG9LJVku2vN+zdje1tC0z0LhM1Eq9MuRbYwVnltGS52ANLECeek7LpC3zYN+YJ8Da
         VBn7WnngZORae7DiXh5KdeL88V27BC749xA6wHuAUbwkTuXcPoEoevNgu3al1fPdmFEU
         H139Dg12Qae8o+NLKqoKf39iywWvOlGzPUsCULWyjP+q1aesVh67xwSzgIIi8kaYkczr
         IeM5SMTMZUngW1C9RXrBu8ULqnJ/l+CV9A9Kmajct5Tc0TBKo/PGi6gjbB544sJSWd9P
         HlfGYfKw8gByoMPUnxRqcCrwgcNLxSpU/B8Y6TBc9jHU28ji2vWfonUZ5OEEQx804M7v
         uD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=dSXDJtPMtY1JFdr7NCmRAELFF/be6sRkfQj2+URQSm8=;
        b=zZ6nyg+teVrXFzRsVAJfu0O0RcgfT9pfTGgf0CIsA9FQOOwlMQZZt1WBe+XJQiTinV
         XddUfQS9tcYlFg7qzDp84xFccHAyQnXrONByeXd/jtPEFDOhEPsSPR/22qFZPTlanI+u
         R18mGNr49xWri2kdgZ4isxSMC3h+dHQ6O6JzUkUbvy7RfCQm/bDn4Ez35Uwk2VUpsyf+
         KDBkyidn5FtUgb857DNlI1VCRutDrcN+chefBOhPzv5IGj4yelqx7294ei5lyeN9Fua9
         PUIDE0dREOVo/LlE5Zxa5NOj7PE+0OjB+/1g11qF12jZWc95hGsFO8TUhK9VnC91Sfz8
         7Ucw==
X-Gm-Message-State: AJIora8jZX0H7y+JBTv4Jsnqfrh933LcMVybEFhmjapjZAsF47KcCxrN
	q5GtyAYXv2L+RSEU5nn25mAQs59rddJlKQ==
X-Google-Smtp-Source: 
 AGRyM1tR2Rw2sLzVDaEkyWCeRmic9oQc9h3yMuvBVhJLvW7Y11U2pLf3u2GrUM0AoxbZsZqLGXGMug==
X-Received: by 2002:a05:622a:1455:b0:31f:33cd:54d4 with SMTP id
 v21-20020a05622a145500b0031f33cd54d4mr15421189qtx.469.1659376954514;
        Mon, 01 Aug 2022 11:02:34 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 v14-20020a05620a0f0e00b006b5f0e8d1b9sm9251385qkl.81.2022.08.01.11.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 11:02:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/corestone1000: update trusted-service patches for
 devtool
Date: Mon,  1 Aug 2022 14:02:26 -0400
Message-Id: <165937694878.869812.16804598720485189563.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220801141256.28914-1-jon.mason@arm.com>
References: <20220801141256.28914-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Aug 2022 18:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3632

On Mon, 1 Aug 2022 10:12:56 -0400, Jon Mason wrote:
> Current secure-partitions patches do not apply cleanly with devtool.
> Update them with the necessary changes to address this issue, and
> regenerate them via devtool.

Applied, thanks!

[1/1] arm-bsp/corestone1000: update trusted-service patches for devtool
      commit: 10034c0b88754f0d5a2919225fe9f970318f74d6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

