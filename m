Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF76C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 18:28:14 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.1155.1673375286504199826
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 10:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=3lesroB4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id v14so11661663qtq.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 10:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwYc6GLNIkmYfgoYLvPpf0nlwPFQ4Mez+7DQNMOLr5Y=;
        b=3lesroB4ZMCMEQiUjVGqq5Nss4dKbYGEo1zF5+2J75GnPbt+LDirKaFX1yeCYc7B4p
         BF0Y6rvVCEwvEHov5pqdNpTKbnbvMOLXW9QDhHY3Pmkb6zNPOoVYBviPK5UwzULdTfwn
         UWtk2gpZmlXWo96vmt7R6do84xpd3zU+HtF4dk7H4SBFMkPU8wD1aN3pe+cnc/mw/9B4
         TRk9A+lOHacfeh18anLXjGvVcQRihtnGHMy032hnr06FV0Rmu3bXbbwtmBfllrRQoAaa
         pq3Cmyt9/QZO9qrPuSfwwQ6wfL74VSAXUdaS3IN3wCqG+ooEwtEC4JTG7en7jXb1vmHd
         8omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwYc6GLNIkmYfgoYLvPpf0nlwPFQ4Mez+7DQNMOLr5Y=;
        b=kl4Qfac4igt1VO2ubOYCQFMFHwd0osBK3KwgahP5tVcpnImOUKavyWrVfZIv6bxQgt
         YHM3gnRjYJoI6phULN/kUXNt7a2UW0xA9pCcCsVmiLF8JrRujoQDs0x/nyFPN+6vDxww
         wFxBEuxeZIgu+i65XO1ixA9cmJVpHRJ0H8PWFtPGQYe1u8xF9fh75pOWVlNvYpq4P4Ox
         hqA2924vJ0v92iEcE/lKLL/n00UQTCfPcEN/kNwmuqE/BAyydiHHV8JJM1USdrY+eoXa
         bg3MU701x3ty5En1B/Y1BjYY7ruaRqdxuAg4Rz+sRVAfwvXYo019z37FBWPt6WB76yYu
         AkuQ==
X-Gm-Message-State: AFqh2kpyg9T3HTPKdMxEnyU6dqfuG+5OgreZl8IuyXwimLmt4Tfm91Mt
	WUN7n1mTT/mtx2SzsBTaPnRXPyqGHn4NQ+DH
X-Google-Smtp-Source: AMrXdXsdI7PKRcK28308fE9qQHEAY2r9hcXRB7J+RnsTzR6TKOMhBpU1TokjSDIA7amJ3KbQGzQawA==
X-Received: by 2002:ac8:4748:0:b0:3af:630e:d9b1 with SMTP id k8-20020ac84748000000b003af630ed9b1mr4040259qtp.20.1673375285172;
        Tue, 10 Jan 2023 10:28:05 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id l13-20020ac84a8d000000b003a6947863e1sm6336659qtq.11.2023.01.10.10.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 10:28:04 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/4] arm/fvp-envelope: name the FVP tarballs for checksums
Date: Tue, 10 Jan 2023 13:27:25 -0500
Message-Id: <167337524536.2415313.393501181287871705.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109172022.2280271-1-ross.burton@arm.com>
References: <20230109172022.2280271-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 18:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4257

On Mon, 9 Jan 2023 17:20:19 +0000, Ross Burton wrote:
> We can download both x86-64 and aarch64 binaries, so ensure the SRC_URI
> entry is named to identify them.

Applied, thanks!

[1/4] arm/fvp-envelope: name the FVP tarballs for checksums
      commit: 8015efe2f1b23c90277f2995cdd2700c6cfb11dd
[2/4] arm/fvp-envelope: update HOMEPAGE
      commit: befd9f1567b105c5f3173ddb7d668fc73b923840
[3/4] arm/fvp-base-a-aem: add support for aarch64 binaries
      commit: 0c4bfbe40aeaee89d09f9a076c5b650bf2166e8e
[4/4] CI: don't pin fvp-base jobs to x86-64
      commit: ddc67dc4bb254ff2adad4266ffbf73aa8008adf5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

