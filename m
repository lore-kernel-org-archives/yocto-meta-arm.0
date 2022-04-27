Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E54FC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:49:01 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.3862.1651103334847920200
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=HvYczcS5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id x9so2359360qts.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vkRmIIYIy/dwgNF7Ch+OHeSOoj8ODO66UoPTsAYny84=;
        b=HvYczcS54b6h2Nst3U5Vej40UWULhT9SiAxSz/iJN8Q1+fDmh/V4+XHyxflb9zagW+
         9PzlkLPjgcmbR4djXqXJXi/9DjyadvGz172uTFTDz8FGG/+/+xjiK4yfnNvk3TuXp89n
         bgcijydGbJ9PQ3YQfIpRK6NoW5Icen/bOGp+U6zA/BaCXiUyLbwaH4c/IAh9hIY0xCrk
         DhjakK6qzJf1sOW/JkJXfuPXoS8UxGfEB9y9iW3cStQoJiyA5gjUX7x1RRkJUxwbnZhw
         4YZdFH4tdLkOba12QjvjTNSySORH4bWa7jHv+gZPT7JmavIieXv+QEyOuOH45fWddLmO
         O3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vkRmIIYIy/dwgNF7Ch+OHeSOoj8ODO66UoPTsAYny84=;
        b=IXnmrfOIES/a0UQVQF6GiScHko8YYuaohvaeXRgqaatO9yH17lkQvdnkjpjzOExyXD
         C+wlxFM1XvUHApURlDdcDxgmL7O/2S+uA5mXT0GruHo6+Y+K9MgLK8+ZAp2MmBvNerja
         rbwOnT3PbUn5xq9ksrFyyMs/1eHOeD08tDPq/cPmxF6fY649d8qYe5eHDV4fl2YKSRkj
         rP7xVx5m4zfd+Mm8geFCl3ykI20daju1aMZh2I79kZq5bHFH0x5pxaqstJNGD7kZdR6L
         awfRo591ts57+nInrLrMUTJ0jgI3IV55h+MWHK3BfZ/M6H0sS0vNgTqaLMpT1WEklDsm
         /edA==
X-Gm-Message-State: AOAM533Qb4V7aqy019BM1CBTzBINQgFNOjZVVIqQYvCoh7ps8RzRNlRq
	RgT5NiZ1TPU44w2heygd6Nl7dNrQjxg3Tw==
X-Google-Smtp-Source: 
 ABdhPJw/GottE0byQgh8xOrs1Ln+NF6yjenHcpLH/VJsxLbWPzqkxZtowOz7cSWIQLMzUU1zfx+A4w==
X-Received: by 2002:ac8:5dcc:0:b0:2f3:846c:2650 with SMTP id
 e12-20020ac85dcc000000b002f3846c2650mr3783960qtx.45.1651103333858;
        Wed, 27 Apr 2022 16:48:53 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 x24-20020ac87318000000b002f1fc5fcaedsm9885329qto.68.2022.04.27.16.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:48:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH] kas/fvp-baser-aemv8r64: Install ssh-pregen-hostkeys
Date: Wed, 27 Apr 2022 19:48:37 -0400
Message-Id: <165110331935.2615227.6025932701427410130.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426121443.3093156-1-peter.hoyes@arm.com>
References: <20220426121443.3093156-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 23:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3319

On Tue, 26 Apr 2022 13:14:43 +0100, Peter Hoyes wrote:
> We already install ssh-server-openssh with the default Kas config for
> the fvp-baser-aemv8r64, so install ssh-pregen-hostkeys too to improve
> boot time.

Applied, thanks!

[1/1] kas/fvp-baser-aemv8r64: Install ssh-pregen-hostkeys
      commit: 74ddd6dd175f4fd1f055b4d60773ff4c52be59f3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

