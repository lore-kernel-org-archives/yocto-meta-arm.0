Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF4DC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 20:06:44 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.729.1669061199323089631
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 12:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Nv4dmHr3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id s4so8002404qtx.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 12:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiVA/gPQilay181b7Fm/mP70gfcjvoHIMk9e2ssreE8=;
        b=Nv4dmHr35p5Dy41ffh9HWhMUIQHnduVVHC4lBkZ58JVzDQq0AywplNLJ60BjTSJ90J
         7ECGIPxih8qhLz0rbQzo0v+GBtvJJmoSy97WbzW/S+xOehSf+Blm7KVGbCOrDkw+hFbE
         eYF171+x5sY7o/4ye+kFMI9V/qlvSKeMIMkB1aLKZeeNLjonWqyitIWHuRtCs38vZi2u
         4mqk5DU1OjSZOtKaJ4y2FJ63cOLJEu5vwj+o9w406ZAYx8m+BX160Z9TupOFpqfd0K2P
         b8dFYtcus/YMhL8je54uCrduim9JlMgKLIq20qA1XDmyqyfngcnOya+e3ECD/Jd8C953
         s2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiVA/gPQilay181b7Fm/mP70gfcjvoHIMk9e2ssreE8=;
        b=oQrIx9+03L/jQkuXe7QxkdAKY4nxb95lvG3ltZUuxIfiiKWiuOfvb6bMVRpJEgfpQY
         1V6dYDthZcoPJJc1PMDHn+XUOd5reAHrO8+Q+35RdNAZgaCxMapWj9XfW2k4CAAGtkUB
         mflMFv3RGNXsn8aXwNEvRyTU3KWfiDC0uM9MFYY7LE1kmDRaKP7JjgC4CS2cdtwGCxe2
         1t+AhnBnwOlkXEhiyeFvjR0mu8Tb+1fRqSqTjdSzWY4ixQAfxQA3a7VrRYPuLa2cnp8Z
         PkOQjbHyZ6UuGXeG88V9uUdhNuEd4aJBJ/CUh+piZuW3BMovMmqaQfJzGvN7IhzJWj8f
         9iEA==
X-Gm-Message-State: ANoB5pkCekpzaxRj00AwM1wZrQd3AL/8Z/CZOsaXL4JzGH8Nrr0pQI4T
	vm7ypOfYhPnTFgHVnXh3WvSiQ3bJHTL1Sg==
X-Google-Smtp-Source: AA0mqf5OgVxsTjABJ/i9jo/W3Zv9WgoyFMkrs/Rf4wLnLCiPUXSvYhG3JfSlJRdjrfXlCfciADGVew==
X-Received: by 2002:a05:622a:251b:b0:3a5:2bad:57f3 with SMTP id cm27-20020a05622a251b00b003a52bad57f3mr19008711qtb.189.1669061198071;
        Mon, 21 Nov 2022 12:06:38 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id x22-20020ac86b56000000b0039953dcc480sm7116342qts.88.2022.11.21.12.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:06:37 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Diego Sueiro <diego.sueiro@arm.com>,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Diego.Sueiro@arm.com
Subject: Re: [PATCH 1/2] arm/classes: Introduce apply_local_src_patches bbclass
Date: Mon, 21 Nov 2022 15:00:50 -0500
Message-Id: <166906085079.3764609.1831449551200688202.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121142346.1502347-1-peter.hoyes@arm.com>
References: <20221121142346.1502347-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 20:06:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4154

On Mon, 21 Nov 2022 14:23:45 +0000, Peter Hoyes wrote:
> This class is to be inherited by recipes where there are patches located inside
> the fetched source code which need to be applied.
> 
> The following variables need to be set:
> LOCAL_SRC_PATCHES_INPUT_DIR is the directory from where the patches are located
> LOCAL_SRC_PATCHES_DEST_DIR is the directory where the patches will be applied

Applied, thanks!

[1/2] arm/classes: Introduce apply_local_src_patches bbclass
      commit: 7fcff00498480d72ad536e785b2297f39dd1071e
[2/2] arm/trusted-firmware-m: Fix local source patches application
      commit: f7c9f58eeb446130e2af77bf2b26be95b6134cef

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

