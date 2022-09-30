Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF25C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 20:22:26 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.1980.1664569344303230355
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 13:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=BgABHVf7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id r20so3360990qtn.12
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 13:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=pk4HuHc2szoSletn0szkvSFLrGznPmGTLDvnLx4cbjk=;
        b=BgABHVf7lJagUZIBIfsLMpfGgaTWl9ir6U3IRvfpdFG4EnmL6QpauHEnbbqZ0IV156
         P0xEHRZEDb9BdgUMRtqTD1Bfzcy1UI8oIAlr0VR/htUj+keSFzERAuEzdXHt8lZgPdnq
         5/EBs97PXDOTi9aw/shhZcfJmYEWwlGY/MPwRBni2oB5YUEoccXG4EVuOxRSe88cPUNP
         LO2jJ+HfU7RvJjYK6vu4UwRddXGfKZMHBQpAjudRpE5prHnvfoavWbm+1uRcLuMbndUu
         MQgNeZqHfVEvSIW0ukAs4H6pn5NYSHL22B9umC83bxlsj/SCUTnNV1WUsNhCIfYUbGVw
         +wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pk4HuHc2szoSletn0szkvSFLrGznPmGTLDvnLx4cbjk=;
        b=POKFG/SRHLtUs/50cUAVRzT2Dj3GNuOaJFQE9NdgYtqJrrzJ5Djcnv6hSIddnTWJru
         CyNYUd7Tjo4e1r/WcpMQ2mIQSI6WakA9Kb6US3u1oE8tHsAhP2QwqtlBmqXk/Ud75nCQ
         YdhjRCP0EqUjhCMtJ8hKnQKss4HBYR/A8p5HeK2g7DC8VUGBhYlekyI0r3cvRHPbLjt3
         B30zRFc8JRfHLuV2iXVhzEPMwIII0Pfcj9f/etziqGIKuUPqwixS8Y27DyHtOlZAOOXb
         U7Z7klyRg3LvHF7ck5+xpHlChNyP1MDmLHpNC4OUa6eNRic+/F55rHbcXRuY74hrhIzC
         rKLw==
X-Gm-Message-State: ACrzQf0cfSpPHd61Vi3k1Es1vN/+PxEI68Ss3ksj86VVSnnn5xCcolDc
	iuiXX8sCtTKFSNcSTCArgL+WI4dtSifrxA==
X-Google-Smtp-Source: 
 AMsMyM5TxjpNWZ9XXx3pIVgeBI8R+PVXjPcAItYltE2P/voeOodj+4HqVTXoz7+sGqA6O1ZRbYFEGw==
X-Received: by 2002:ac8:57c9:0:b0:35c:dd3c:3616 with SMTP id
 w9-20020ac857c9000000b0035cdd3c3616mr8479382qta.395.1664569342943;
        Fri, 30 Sep 2022 13:22:22 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 16-20020ac84e90000000b0035d4b13363fsm2902702qtp.48.2022.09.30.13.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 13:22:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: Remove uniquely zephyr machines
Date: Fri, 30 Sep 2022 16:22:00 -0400
Message-Id: <166456932182.1898292.1301700384415411650.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220930173446.15025-1-jon.mason@arm.com>
References: <20220930173446.15025-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 20:22:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3886

On Fri, 30 Sep 2022 13:34:46 -0400, Jon Mason wrote:
> Remove microbit-v1, qemu-cortex-a53, qemu-cortex-m3, and qemu-cortex-r5
> from CI (and the tree in general).  These machines are part of the
> meta-zephyr CI now and keeping them here is redundant.  However, keeping
> zephyr builds for machines that also have TF-M.

Applied, thanks!

[1/1] CI: Remove uniquely zephyr machines
      commit: 8d0410782e25ea5cf59aa8025cf86bd17f5e1a60

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

