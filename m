Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5109BC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 14:41:55 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.105774.1671028908528699396
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 06:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=7WpdIrN/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id a16so2556637qtw.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Dec 2022 06:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzuA4kR3djGnkvlx2cOSZrU71kiV4HB0ew+AH9ffdyw=;
        b=7WpdIrN/2mrBdobYniEp7xp1R/4C1KZ172+fSXvO+OzIzbwUj0EEJzE5csIln5nuz0
         QxBfLWhKDih7bAK8Fwx8W9tXZtOWG/spH1lt0KZEPbnE0oILJ8Dwhd8oks2dG4O6ESCS
         2KUKPnowjni0VoSiJNXVoqLlD2ez3bvJ2l/jypi79OqN+WmlM5c6dT/7EfO4hc99NzaH
         6v4VzMAfIVAwlFfxVDt+lw8l+vlTJh0Zjz0DvYIE7cHyCWDGUexnjIX/AUyfWThR7Zz9
         tT+3t5w6TH0G8kX8KzvwGkTZbg72Hxk1+aV9ifqSvC8hpXXPAUyHWryHOfpsS0r26iqT
         xBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzuA4kR3djGnkvlx2cOSZrU71kiV4HB0ew+AH9ffdyw=;
        b=GRmXwFN+rfDMkDQS2nfgI8rYXpU/l+kuxtPNf2QR+QwqCLxVbbGpnh+y6YmzXh4zJF
         QrUzFGr+by9E2XA0VP+DTxdBOYWARAppfgCca6OPl6l5EvS0P1JdMvj9XMvnAVP9vuTQ
         DmVcj8hTMOAZP1kGmjDBsc6xJqO6hLSTkJsfKAsloiKwCQK0eTF9FTCBS5z9y6HP1XYR
         ckjJmBpbm7VvA3xENnN9u0Djne7WCBdmU7hbjA3y3zijv3vKklzZcG9yuMufusgWr2ZB
         kRTpechABOor/pcQiUS9M8MJVk/pFIcRr74vr+SaccTmi3SUL0mKTdRQwNyenTzIR710
         q/VA==
X-Gm-Message-State: ANoB5pnjmIOvJaTztEztsTipi+oSUUvzLBsXADTjZX07ZJp7h38KKjNN
	NNpgrEpibcQz9JRAABKyU3vxfkcKzI1iLWhM
X-Google-Smtp-Source: AA0mqf6ROxXCgy3XvKy0hOI9s3AXL7ZyatNPl5A8manifTES2gzyZQCETCYvVLas0BM0db8GwJu6+w==
X-Received: by 2002:a05:622a:1c1:b0:3a4:e849:a235 with SMTP id t1-20020a05622a01c100b003a4e849a235mr42055009qtw.34.1671028907143;
        Wed, 14 Dec 2022 06:41:47 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id z12-20020ac8100c000000b003996aa171b9sm1706763qti.97.2022.12.14.06.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 06:41:46 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Qi Feng <qi.feng@arm.com>
Cc: Robbie Cao <robbie.cao@arm.com>,
	Robbie.Cao@arm.com
Subject: Re: [PATCH][langdale] arm/fvp-base-r-aem: upgrade to version 11.20.15
Date: Wed, 14 Dec 2022 09:31:59 -0500
Message-Id: <167102831896.4114714.1616448229223384706.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221214075500.2891854-1-qi.feng@arm.com>
References: <20221214075500.2891854-1-qi.feng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Dec 2022 14:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4182

On Wed, 14 Dec 2022 15:55:00 +0800, Qi Feng wrote:
> Update version in documentation.

Applied, thanks!

[1/1] arm/fvp-base-r-aem: upgrade to version 11.20.15
      commit: d7660ca61837b85d9b06e6af4243acb8a45773bf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

