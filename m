Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC3FC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 14:53:12 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web09.29148.1643295191319713949
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 06:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MeMl8y/O;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f175.google.com with SMTP id i1so2684563ils.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 06:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0E2us2SxiD0zNhjF9K8UPHr2n5OCP0P0T0Qe6qgCzcA=;
        b=MeMl8y/OYseZ0h4HZASSVsGzjInyeFjc282X03VUlLfEnI8Cxuo8beCzBo2rv6ip4M
         eaa+Ao2epb6Fe2sAGcWqTQ85cmzXG7rGI2U2GMe1yhEf5+W+TuYKhHn0LLC5Mts4Z167
         gt1eaWfhqsJDFyMqlIvAgYLvz9f5Ts7M9h3oHFLlslq6NnYknAPbifaUaaqgH9lq5w6A
         3Z8/7PY+yKugqnSOHTwvC/JKKvDGwhUiOVQ4+C67uy1tvmr2Qkyc0SJ4jRHFImgS9tZS
         r9h42buOyNbb0gjKlg7d3kQWV5K3+mbyEvmTIFcJDIOJtdTx/TKDmDVjWkx0TsjPuUrl
         5URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0E2us2SxiD0zNhjF9K8UPHr2n5OCP0P0T0Qe6qgCzcA=;
        b=Tn1GxsttMTlZVkW292GIgVS+Cj5BuVhqFy1E29eDJ1BwDshyjk8rxiHHyxNsZIr1j5
         Xa3f07gLLOf9JivDWXraTX5JP8kwQG7mmOcGJAdZzfnRumCr1nNQa1DEEzB8Bv7s16uc
         /69vTn2zk54/hFEDDY6UVtAopn6TpUfkrrSMWrfzg+u6mS9o3KNL3k7C4Xhqzt/N4SB0
         a3x8f9wES3QlQgqrItGRCsYt+lA/vleUjJj+dJeCgKmdRHS6S8EgXY7m47Fc99FawNxk
         of5hc7ojyyAsZFop8lyocMUe133AlnJqKgoyTmThdaoZ0JiSnx5VE/Yft4o3+w6UW77F
         LFXA==
X-Gm-Message-State: AOAM533we6RPWFKiBNgi1l6Wwgv1yZ5MUd5Hdr523WhaRfpr0aNeuljx
	xLI73h7pbe47bXBUMwcA8EpW9t4TNq6Kfw==
X-Google-Smtp-Source: 
 ABdhPJxaxIFbU2EBmCoNFoHUToaD5n5OiB25s1aKyQjIql5Y40An0zhfSVAKLf42LBnHwV4/uo6Cjw==
X-Received: by 2002:a05:6e02:1a6b:: with SMTP id
 w11mr2700139ilv.44.1643295190573;
        Thu, 27 Jan 2022 06:53:10 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:9284:4f59:da90:5ac8])
        by smtp.gmail.com with ESMTPSA id
 d11sm4136489ioc.49.2022.01.27.06.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 06:52:49 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] scripts/machine-summary: improve layer_path
Date: Thu, 27 Jan 2022 09:52:22 -0500
Message-Id: <164329514241.147780.11507249338611790572.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220126191253.1844130-1-ross.burton@arm.com>
References: <20220126191253.1844130-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 14:53:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2919

On Wed, 26 Jan 2022 19:12:51 +0000, Ross Burton wrote:
> As this can get called lots but the data doesn't change, cache
> the responses.  Also return a pathlib.Path, as this is 2022.

Applied, thanks!

[1/3] scripts/machine-summary: improve layer_path
      commit: b1e4cff75df54ab6d49c3b1a67e4fef806de571d
[2/3] scripts/machine-summary: link patches to cgit
      commit: 57f03491be7838279999a537384e0c9987e052d7
[3/3] CI: enable memory-resident bitbake
      commit: 828ad702acf6ea00907a9bdcd6537b32cc0ff78b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

