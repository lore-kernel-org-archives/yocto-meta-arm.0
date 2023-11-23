Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD868C61D97
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 16:25:28 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.95008.1700756722885489883
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 08:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=o+8DnAqV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-778927f2dd3so48684585a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1700756721; x=1701361521; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+Iibg8jqVlQZv7T7gQsaw9Gv3KCKKsRbkyU8HC2UoY=;
        b=o+8DnAqVJ/ie4fXi7Desbl4mej1xZxVqWnteMcOosmPuIxyFuyjC0ajMKytecC8exz
         2skRL+u5rxhZlACYxg+AXXdhQH1HnnlOyX+UaITrWW6dRYya65OZp/j++PedGFaIyWtM
         UkjQGufmMJUlDKMJwmncp7XzDZaHR+4C+BD6wq+vFvEumjXQzLupMbay6+OCqazZ88NE
         4TDL9S/ad6qf4t1YoE5oVGbTqtN8RNuEtMBb265Y9lw0yySVdvKj+wveTy4De7YL0e8r
         ZnFzbRwKhBjFLuRUQf5ntnCKgu8HMPbJ4LHPeeRheuvU+7laBWLYEuG6XEBhTKOS71OY
         Z2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756721; x=1701361521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+Iibg8jqVlQZv7T7gQsaw9Gv3KCKKsRbkyU8HC2UoY=;
        b=qS68f4hcXcKquwz+LgP6CEqd/bcLwBTq0SGIhxUfJ7NyuOkGO4thn2EbadMA0A1BnG
         rSGhJMEwef207M/zZJpWtIe3hu9TsANbQcB9NoJBeo/EA3UEHVLLhaKAmXkv8uPTtdBh
         CGD89xxACLUjHoxIjiEPF2jAzZhaGJYhslGrnygjutNJyzpr6XJIGmt/+FwFLas1oK4U
         jXHOe8w9xzA02nkU82ex/Q9zYAuWGTtv+16tjn5RsuJ2a5z8vbfjkb97bhzo0SusTUsi
         /yiIcb2uvuAsFJ6aT/t3B07XyR/hVpfUt3bhaJDocNeVywiX3bMiJHnYTEn9MVNHeoJu
         bHbw==
X-Gm-Message-State: AOJu0YwywvY0VR8Vh6nhwZgFHsmv+gCTzHd23ONVa4dRt7tsassQQBsn
	ypVnXiAlfS6fAMAwN8jRAU0GVxY4eo8IvxOeyFM=
X-Google-Smtp-Source: AGHT+IGf/LbDwNHQbncQho7YqdQIOk6AP5LHwKdQkBhW9/+7d9Fnlagx185B2dUEVpOEhfBN7/5XJg==
X-Received: by 2002:a05:620a:2546:b0:77a:7762:f541 with SMTP id s6-20020a05620a254600b0077a7762f541mr6317538qko.58.1700756721071;
        Thu, 23 Nov 2023 08:25:21 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bk30-20020a05620a1a1e00b0077d6700a460sm556602qkb.82.2023.11.23.08.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:25:20 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/corstone1000: fix synchronization issue on openamp notification
Date: Thu, 23 Nov 2023 11:24:34 -0500
Message-Id: <170075667406.1682259.2599155461322562962.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120153738.2732021-1-emekcan.aras@arm.com>
References: <20231120153738.2732021-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 16:25:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5262


On Mon, 20 Nov 2023 15:37:37 +0000, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> This fixes a race that is observed rarely in the FVP. It occurs in FVP
> when tfm sends the notication ack in openamp, and then reset the access
> request which resets the mhu registers before received by the host
> processor. It implements the fix both in SE and the host processor openamp
> wrapper. This solution enables polling on the status register of mhu until
> the notificaiton is read by the host processor. (Inspired by
> signal_and_wait_for_signal function in mhu_wrapper_v2_x.c in trusted-firmware-m
> https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/platform/ext/target/arm/rss/common/native_drivers/mhu_wrapper_v2_x.c#n61)
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: fix synchronization issue on openamp notification
      commit: 63bb9a306e82149ec6abbe9771e731991130738c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

