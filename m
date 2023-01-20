Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31205C004D4
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 02:00:55 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.64850.1674180049696861610
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 18:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=eMCAGSaK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id u20so2890768qvq.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Jan 2023 18:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ShRU9KDBGinGZSsIASNrKpV6Zcr61tHr6fOr7eZTiI=;
        b=eMCAGSaK8IH3OeERZ5x6Eop+tdrrDXeGir8/0BUQzOgV1gq0h/cdWMDhBlkQxqPBVt
         NWBe5krSIYY8NkUGUPZV52lSleFAjKIS7YdH83miQCLycuy7dPLd4+oD22WXUsEpLboj
         sd6bjhEixTRyZEyNNusaLsOoOfzLDZT2zTs8AbZflveRlLvogFFM3134vyz79j89qSmI
         lRWLHMfuTog0gj1k4/9eQSL8pe4T9ZnPprH08SOAKMdU1yxQa2x6oBDKsJcu5/wBRj3u
         3+eZ3zY2eFhVp1VxANMp/KsKycihiLrloN3xLKmTZiRtjJGe5AT+vrOTHTvuckm/H2t8
         F15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ShRU9KDBGinGZSsIASNrKpV6Zcr61tHr6fOr7eZTiI=;
        b=M40ms06sWPiRUc4oib27QXrjfIiYtacWmcAmiqiKZqdQ8ZgoXLt2xe8EB3CwioS3XI
         jC+XX8NsVmCeJf/mGXxYAzS0xlXZqG3a4nVIc/uHcCSdz9dOcelXxqDwV/Pep3+6uehU
         py8cNP6g/1Hr+niOx2NHRtkYdNE54U7KEa1LgQQL5wyj0kTTiFn0JaJtS11oK2shfXys
         5cfYo1BFOxucJX3Pxtr7HoTn3F+rO47mjavm8VAFUGK+mSCqY7C6dRd8DOIKGoFVSdAa
         zpxGWkluGquu/kEoKHTc1xM7ylesKcVwsYMVyo28bYOJw2xPvPNmXUQ1bR8BZ/fKPrRb
         bIgA==
X-Gm-Message-State: AFqh2kpfOPxJeD/DX2ssYCJeIDSiNa23LqxF7m4TGAaNDfA+TqJN6lwG
	7bUz+FdDRoZuUa86JSOyULMPliuZ7xG9VBux
X-Google-Smtp-Source: AMrXdXsoGHatg58fIRksxG1dypSaz3o8MMBP19DXwmessvLvJS33DHCYMCQ4rKxWepFkAbBstzzBwg==
X-Received: by 2002:a05:6214:185:b0:4ca:28e3:27a2 with SMTP id q5-20020a056214018500b004ca28e327a2mr18666693qvr.49.1674180048144;
        Thu, 19 Jan 2023 18:00:48 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006fa43e139b5sm25207053qkl.59.2023.01.19.18.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:00:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH kirkstone 1/2] arm-bsp/juno: move to compressed initramfs image
Date: Thu, 19 Jan 2023 21:00:35 -0500
Message-Id: <167418003544.2034067.13037641197708694746.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230118155452.592-1-jon.mason@arm.com>
References: <20230118155452.592-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 02:00:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4300

On Wed, 18 Jan 2023 10:54:51 -0500, Jon Mason wrote:
> Change u-boot and machine config to default to booting a compressed
> initramfs.  This allows for easier testing.  A compressed image is
> needed as the image is too big for the storage, and the error notifying
> of such is vague.

Applied, thanks!

[1/2] arm-bsp/juno: move to compressed initramfs image
      commit: dc9e257f2b20a58337f33b58fdedba722e6af150
[2/2] arm-bsp/linux-yocto: Update juno patch
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

