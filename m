Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B22FCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 03:59:23 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.17833.1694491162701208622
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 20:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RYAh3YFR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76ee895a3cbso321815785a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 20:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694491161; x=1695095961; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BQWQ+oHaueQApxjVoP+14ciPv+fsGLBf+1ly30yQxM=;
        b=RYAh3YFRAtc0A11C/adGkj0NeL1QLT4vzRcunJzAz/6UZsAAPaMFWIiYmrtFwZT2+2
         ui7yYsfUcH/btDCYnMFX3RdIKNFZM3OcpHhCSYV8LWkkrcWZW+QWEgAIZKuy8SQCai7d
         aEhF4DDmzpjJ77a4hT/39NNkNUbortjsuUDbMA2a9gsYkcgWdBLZhrSJLzBXdZhwc1Ut
         lqCozSky/DNH3XoniJLZFhvJBftqwHhX5ep4LMzoYYbFyovuzJ/aGsJIbziuiWh1xapa
         0a8b9rmUqYJxpfPTn4Dwtgjy5n+W+GrsedNiQ0e6TaXbnzGmzS+1JGKmYzeGTtDzaw3J
         Cqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694491161; x=1695095961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BQWQ+oHaueQApxjVoP+14ciPv+fsGLBf+1ly30yQxM=;
        b=dvF2ZiDaMXp/4QRy/0gs2JnbflUtIeh3Zg1AlhYOTwplQVx5U9rK+wMB8FovqiuqGu
         DEqRT9i1r6wdt8yi79TVM7V8nKHri8a0vUabtwbAfJmC5/NL8ICRkSdme5WJRld/HzF3
         zeJMquAbtBs8grPw+0VyvaZLB7A6Cemylaj+5CjLuhow5skX0BfrYFtbku/8BFXOwWT1
         CNLjTfpAwAXI0Qi3QI7OWyA+xsr8y2bvCbZM3YZsdDO/3YKqtVfXv+b6XbMQtl5MTV/1
         GeT2tHX7bObB0X0b5Zm7K5K7cVdiF2tHglY1lH7osBduZxxthbgBqlarlvSbqe+3t3MA
         29Pg==
X-Gm-Message-State: AOJu0YyIo4N29dHSGA+sePbHXpFPAqIs5Ebn1Wz521x+GT4Ac58/KlJN
	7bFvLRxTxL0cbM5hWFj8NeMzjaqcUJqlIpdOqZs=
X-Google-Smtp-Source: AGHT+IG7wUgKHTysrLkZHBRa9IjL6cg9tKF8sdXN8iZtFLXnBSHFnst3odT9HUlFpBnXhyA1VSOLWg==
X-Received: by 2002:a0c:e50b:0:b0:655:dc84:d744 with SMTP id l11-20020a0ce50b000000b00655dc84d744mr8529739qvm.25.1694491161390;
        Mon, 11 Sep 2023 20:59:21 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g2-20020a0caac2000000b0064721cf1535sm3385665qvb.62.2023.09.11.20.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 20:59:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	xueliang.zhong@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: update to linux yocto kernel 6.4
Date: Mon, 11 Sep 2023 23:56:39 -0400
Message-Id: <169449099948.3039896.1048270756940665594.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230911135713.34756-1-xueliang.zhong@arm.com>
References: <20230911135713.34756-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 03:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5038


On Mon, 11 Sep 2023 14:57:12 +0100, xueliang.zhong@arm.com wrote:
> From: Xueliang Zhong <xueliang.zhong@arm.com>
> 
> Bump kernel version to v6.4 and rebased N1SDP kernel PCIe quirk patches
> top of this new version.
> 
> Xueliang Zhong (1):
>   arm-bsp/n1sdp: update to linux yocto kernel 6.4
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: update to linux yocto kernel 6.4
      commit: 1fe76c893cfa7496b2ae089707b5fc98e07a1900

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

