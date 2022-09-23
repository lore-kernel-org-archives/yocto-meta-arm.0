Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097B7C6FA8B
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:31:54 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.8801.1663947105484835797
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=hn2dmzRT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id g23so267225qtu.2
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Xdbh/QmV1PFXZlUzEVi9DdOoaFS+BT08knfjHul5ta8=;
        b=hn2dmzRTxWp+CeDQ0N6Zy8jpm19sfMewrS2tOCSZMYb03OHhWcclf/nzmG4jDmoSwO
         FEeDpSXFhpkKVqW8qG6bRp69OM7IjfBLhy3xvXlgaZLIvXOohlbN8qc4742WHrdQpLkF
         2gInQbLxVAA17SxDNg4R0vFKjIuQjv/awirTguipQeA1b17GUdQd0b+kdcQGupIzIXor
         OaGHTZzKiVofKjFswedtJmDNQS3dlZjSKhOa1Korv7Y1G0wKqvRI/v+V0GbaFXzWvGir
         v49CtNvkewuv0ke+kYnQ7MbS5JTXcD6v7Sj2X98cSwJvImkZqkp6yJ+MMsyHR23KwwFn
         /ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Xdbh/QmV1PFXZlUzEVi9DdOoaFS+BT08knfjHul5ta8=;
        b=up+r64JSLCtTS+MUnFLkk7OxYMtGJoflrtk7cFtl0Mc/+hpPtFYYN3YuNfSoDKpgHZ
         OuH4cSF6x9iS212uPD0Me4nIFLDiUBA26PHuJ9ARx5ihF5EmDT1KyoQXusaXdS4KDmNj
         qySqX7wgh1APZ4Qnvdns0tm3+bg5B2Ri9dCJgPNbPV9T1PTBYewG1J/I+6Lp1AWz4PBY
         GkCjALtRslma9boBHrKaZV1mt9hSVWiLJttkkJLLjYo8khe+Zx4Dj+ktQnbHDSgFYdzq
         brjRRxAaOi0pa/5YZFjwHkIimcqwUoLh6nNDxuIsbXXSHty1lgFwDdDoFdrdBF0LRk3j
         pJ+w==
X-Gm-Message-State: ACrzQf1o+RFyDZiz4XxSs6CWXxqNxKLl2W7BfDj0l90Zr7SxeUTrHa+1
	OfLGqDlf6zTy8jA+8Zdor3/PZd44yuGFAA==
X-Google-Smtp-Source: 
 AMsMyM6+WcY+t94ouUxvUfgamqAlaalrXIOhVFmlz1AzSxy5Ax9pYDJvHlcvAla6UF1GtdehlX6zsw==
X-Received: by 2002:a05:622a:1314:b0:35b:b11c:a2d3 with SMTP id
 v20-20020a05622a131400b0035bb11ca2d3mr7579885qtk.69.1663947104122;
        Fri, 23 Sep 2022 08:31:44 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 cn15-20020a05622a248f00b00344f936bfc0sm5665620qtb.33.2022.09.23.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:31:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/4] arm/optee-os: add ARMv7 changes to clang patch and
 update patches
Date: Fri, 23 Sep 2022 11:30:56 -0400
Message-Id: <166394706727.2062239.7545140838196838561.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220920223846.8000-1-jon.mason@arm.com>
References: <20220920223846.8000-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:31:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3818

On Tue, 20 Sep 2022 18:38:43 -0400, Jon Mason wrote:
> ARMv7 does not have fixes for the clang issues already fixed for ARMv8.
> Make the necessary changes in that patch for it to work.  Also, update
> the patches (via devtool).

Applied, thanks!

[1/4] arm/optee-os: add ARMv7 changes to clang patch and update patches
      commit: a3f22f90bb72a49b0b0fabe756e01a80e175bc45
[2/4] arm/qemuarm-secureboot: remove optee-os version pin
      commit: dfd03ca1a3549ed460350839cb460c94df2dca40
[3/4] arm/optee: remove old versions
      commit: 606e7d4c4e2f618956a8f4b1d792f19a62e62a05
[4/4] arm/optee-client: move the 3.14 recipe to meta-arm-bsp
      commit: abc8b4fe162a7199698989e7c0af329c87676fba

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

