Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BD4ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 18:59:19 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.2208.1661799550424148954
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=GMq/BQPt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id y18so6887529qtv.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=FD+hqL82DuNEjdrqhBqzDa4pCUfbxHRZps26xXzZr1I=;
        b=GMq/BQPteH6WHU3U+c8Aaxjq0JszpT10EGMk5N1kiC+EZTvPSUGCbOM6r1ImIr+dix
         QqHSsbVqdwLWnjaKfJx4d3IhHMs2ICGU5sQSDRT6mA3L9xPIsQvUU0bdRSF//RcYnwA1
         xqSfMnbJYC8v/lEX6rvGgSjBvDNw+VC86DprMFh/jtmmJDjwLiLNh3uwqPg+XyeVN+0T
         E0dy3FkiuclbJD+4nVe1wQt4tAsL82vIEM0bmkJmBkANC14vMsDjguD5GMWRqgGANi5r
         hcDlvYLaJCqx6490A7U4COa4ssXJag3EzBGZVG77cZPdK7fuC69jnuJYbAkJAONfD3rS
         xL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=FD+hqL82DuNEjdrqhBqzDa4pCUfbxHRZps26xXzZr1I=;
        b=A6UqRQRVj3gEAbz+Ey2TbcQ5yQ/via3WKORJKsDDEH7GYjUXOW9oLxeFLLvGDBEww/
         7cjVq5DBgrdh5nR6tu/zM06TqgmR4VsRuYjsMk07wYJaPlUGk9AGxsj+qwk9eBW7n2UI
         7QqswfFjYaVGCqF+qIU/YtJV40pPWANICGrJEI7pf8nZViwpVexRF0NN83AWWVpbjYFh
         rT82khYqljxS7ctvh2KI+Z2foD/54AWBOD1hFa/TLOCzuLwgMTJiNDbB8MI9b7LjwbqB
         5tbeuKnQuND2J/6xYzrPezc/grZaVrcnVo3yYB4GevLMDqsaaB3uJL1syr9Jdsup5Gqz
         C/7A==
X-Gm-Message-State: ACgBeo3zkqBskeZTbf2sLpte5ZpDAUON/JLlDsQhy/HjJPymXKwh1Sha
	AL2ajAZH2zLLfYZx/YLKTKahEMeF8q6eFRxU
X-Google-Smtp-Source: 
 AA6agR4iT/8ILdJQxNM3ke8PjPwtFlzZupy55OSxUYvc6G27Bn630rzH41wc7+yOM57ljRCzUwr+Bw==
X-Received: by 2002:ac8:7f11:0:b0:343:6bd4:fc with SMTP id
 f17-20020ac87f11000000b003436bd400fcmr11774511qtk.318.1661799549074;
        Mon, 29 Aug 2022 11:59:09 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bs31-20020a05620a471f00b006bb83c2be40sm6730619qkb.59.2022.08.29.11.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:59:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] arm/tf-a-tests: work around RWX permission error on
 segment
Date: Mon, 29 Aug 2022 14:16:20 -0400
Message-Id: <166179698237.462911.17178314891595099256.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826101021.784450-1-Anton.Antonov@arm.com>
References: <20220826101021.784450-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 18:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3722

On Fri, 26 Aug 2022 11:10:21 +0100, Anton Antonov wrote:
> Binutils 2.39 now warns when a segment has RXW permissions[1]:
> 
> - aarch64-poky-linux-musl-ld: tftf.elf has a LOAD segment with RWX permissions
> - NOTE: recipe tf-a-tests-2.7.0-r0: task do_compile: Failed
> 
> There is a ticket filed upstream[2], so until that is resolved we can
> disable this warning.
> 
> [...]

Applied, thanks!

[1/1] arm/tf-a-tests: work around RWX permission error on segment
      commit: e16378f492ff63ea3837232d656f1275a5b2ad7b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

