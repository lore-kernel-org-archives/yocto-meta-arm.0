Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320A1EB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 21:20:58 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.689.1689024048161606678
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 14:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=0Dy3N0Wo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7658752ce2fso358328585a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1689024047; x=1691616047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbet1EiFkSmXBE4Ou88n3ZurXb1/HQT2rGlGGjkodhM=;
        b=0Dy3N0WoYb+vCob1FJ6iISwBDygY/+A3I59xl17hobbDsgwDvaLzbGrcidMOqdaVSt
         +8edTou1O23hqkhuY53qRUSXPMva/FaDsuEknjRIz3RwgbqlbTrkf0D4RC8AOPAc9mwN
         X8Zyvj5ix4WclcqsZxeuHIitLLDuOlzUwW/I5K3TlCF/UofPXoF6Hn1UG2kUgc5TqP+7
         vpGoBy4Q3ON2G3Mum96l2QVtOKi5hVbzoSRY1O+09XkHU7Y+VqoPWAFikptabfgLQx7n
         xZkfLMlREtyYlsSdTAvHusbbDBJk+h2MchiuhIMkq2B3C/3Rp4EZ7KCqChLXcf7V4cXl
         uSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689024047; x=1691616047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbet1EiFkSmXBE4Ou88n3ZurXb1/HQT2rGlGGjkodhM=;
        b=QjGNCYcq2dJbN73CFQSHH0U/x5lNmIVNnW9nAaTlDYrLUI0vX/FXswJ/UJ4SpF5D08
         Zq/jnQmgfj4vXwJgTwH+wP0w2JRC9ixd4g1oPxCBn65KY/qdPNam9QjdhJVfbAVKnsLM
         ccp/mW5Jwnvg2kcREJXfBN9w6mbniTQon82Nfaw7/pIEycLY2wYBhI3W+NiVqf7MwcHV
         fZ9LYe8nsZne1nPjGMPqd/LySPnmRfMJQkI19Xy801oQuOcCzgrg97qYKi7lO8ql/Aho
         /kG3JqvcxQs+AVwI9mufCNywVva+2ewx3PbcAotB4BVrJ3cWr5ckFGx0v84LDoM709Cg
         YQ0Q==
X-Gm-Message-State: ABy/qLZb8gbcC4R3eg90Wv1BPfGRiwyQDiuNId+0ykXstxty6mcwkZpm
	XYPyJAtSYUQZqJNVjuIqqgO0QFNCCmOFrhFviCI=
X-Google-Smtp-Source: APBJJlFz5HInlih+iC4+AJ71XTj2rmy1nu4rnSSiXXKNFMbvschsS6TWdH4xVU9mw6V5YyzpRXOfdQ==
X-Received: by 2002:a05:620a:17aa:b0:765:58a4:1e82 with SMTP id ay42-20020a05620a17aa00b0076558a41e82mr14090853qkb.47.1689024046814;
        Mon, 10 Jul 2023 14:20:46 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id pj48-20020a05620a1db000b00767ba88f0c9sm273051qkn.7.2023.07.10.14.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 14:20:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/5] arm/scp-firmware: set default SCP_PLATFORM to MACHINE
Date: Mon, 10 Jul 2023 17:20:28 -0400
Message-Id: <168902402803.121511.10418261848778424643.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230710130916.3414041-1-ross.burton@arm.com>
References: <20230710130916.3414041-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 21:20:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4877


On Mon, 10 Jul 2023 14:09:12 +0100, ross.burton@arm.com wrote:
> Many platform names are the same as the machine name, so this saves
> some typing.
> 
> 

Applied, thanks!

[1/5] arm/scp-firmware: set default SCP_PLATFORM to MACHINE
      commit: ce78057a719c09d3e8f9ac49da055be4ad392fae
[2/5] arm-bsp/scp-firmware: remove redundant SCP_PLATFORM
      commit: 64b33efb95276990c309c630faad5bfd0384d298
[3/5] arm/scp-firware: update compiler variables
      commit: 675dce4d63872b28563661f3f76020c8a76fcea1
[4/5] arm/scp-firmware: log what platform/firmware/type is being built
      commit: 6947632e0b231a34b9706a98ade52f48455ed5a6
[5/5] arm/scp-firmware: fix intermittent compile failures
      commit: 249b534ce73728ffc488a53fd6b3ef6a596f7e8d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

