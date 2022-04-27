Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB24C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:48:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.3860.1651103316700038368
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=jDKdzbfO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id 126so1534700qkm.4
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qv4n/Vphi8ZG0PTYgfyTel7oufbYvXjD9c+45KWxYSI=;
        b=jDKdzbfOERKH1KVqHkmm3jBN5PMUkBxttSnB27l45nILKt/aEIBXFhy58wopADhKWG
         1+3iA1tgIOIai7l8enWG1oUhDKe6gZlmcFftjtcYK0OkxDQLyQl9aiXAI+reZ8C8M/bN
         N8LQnjThMrhEjNvUjmvTFAemzELnlGeN98rjTSZBw/Hkta+A6lHRjCsnTeV4P7Ug+uUn
         opmDZYloeBHf/RlH9TYrattTxG9kuHrcJE8SypSegK4Bd8a272cMqryiC+8gJMqHc4Bx
         kOimVfFqGMvgGV/N08leGWfnLPf4KRuNECuDt2U3YTzXo1Pg55KLaZU2XMm/xQWIuyeL
         WdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qv4n/Vphi8ZG0PTYgfyTel7oufbYvXjD9c+45KWxYSI=;
        b=1jJ66LM/pwn7/MZUv3zBNh1BozpQADIlOJ8EOv2/w1fnkzN9x/BzaOuCDa6WVbBDc1
         cKkCU/cTdAmA1+jaUVLeEJl0GAKmzn3niAaFzxwi8nNrpebUvPkIDu9Fcw+HHG94FF58
         mWqHcthpoR5t7wT1jsWgwQAlrRuVLZysoaKnZ571/YJVg3ynK81OoMawwTi0weuNFwRv
         G+Rny9JD2skg+gLp2IJS5rJHSJkQOzpOEVgCFYkeTAECsFcz4H7Jo7K7Oij/6auqlzeR
         sawoOt4AsBAODc5rmg/bsvbG1LgxvJPcFI23tXg6NzPPwesggjinMjQhFoPkQg4qAh9Y
         52vA==
X-Gm-Message-State: AOAM531sS/U7TbnbUMD8JDVIt7Gg0SA82DpWEuLEGx70CzXirEerskhi
	LOIVCq9pdbGVlCtzaqsVtmIVVtCiFjB6GA==
X-Google-Smtp-Source: 
 ABdhPJz25pP74La6TlzEoWFqZ21hxw5u5iu0ryFg6O3IkRlyRAbH8qrX52G7lWlL16U+LnDGDeQ7bg==
X-Received: by 2002:a05:620a:461f:b0:69f:6a78:f1fd with SMTP id
 br31-20020a05620a461f00b0069f6a78f1fdmr8926847qkb.53.1651103315674;
        Wed, 27 Apr 2022 16:48:35 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 f39-20020a05622a1a2700b002f367d7a7a5sm6521184qtb.23.2022.04.27.16.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:48:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"harry.moulton@arm.com" <harry.moulton@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/9] arm-bsp/machine: Backport runfvp config for
 Corstone1000 and update runfvp script
Date: Wed, 27 Apr 2022 19:48:20 -0400
Message-Id: <165110330060.2615102.3993314815586017014.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 23:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3315

On Tue, 26 Apr 2022 13:33:50 +0100, harry.moulton@arm.com wrote:
> These commits add the runfvp configuration for corstone1000 to Honister,
> and patches for the runfvp script itself to fix issue with running cs1000.
> 
> Signed-off-by: Harry Moulton <harry.moulton@arm.com>
> 
> Harry Moulton (1):
>   arm-bsp/machine: Add runfvp config for corstone1000
> 
> [...]

Applied, thanks!

[1/9] arm-bsp/machine: Add runfvp config for corstone1000
      commit: 0ea4b2220f8463e8d46f1e13c3986aac213ffcba
[2/9] runfvp: add an asyncio TODO
      commit: cc1c99f53737bca1e503da4e08ba11e5b27d2ae5
[3/9] runfvp: handle the fvp quitting before we kill it
      commit: c72527d6a5c8be469136a4d5cde62d63283e11d9
[4/9] runfvp: don't hide output when using terminals
      commit: 55453024ee5cf5bcf396551e7de10c77d0cc3390
[5/9] runfvp: don't use f-string when there's no expressions
      commit: 5920774ada13e3f265913d17e6f44d56cb23ba26
[6/9] runfvp: refactor terminal selection
      commit: 0ffbe558a0bfe3aec7110cde7a25fbcadd91d01c
[7/9] runfvp: fix undefined variable in terminal selection login
      commit: 4b8aeb6edcc95fc747cdc8f56b3717830e6c9e5d
[8/9] runfvp: propagate the exit code correctly
      commit: 952e04cd581672ccaa3c9b58227af5b45bd1f870
[9/9] runfvp: check for telnet
      commit: 2623e69db362b357db45c343e6d504909552c2d5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

