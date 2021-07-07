Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.18824.1625649373118621784
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 02:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=FF9c3oP4;
 spf=pass (domain: burtonini.com, ip: 209.85.221.44, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f44.google.com with SMTP id t6so2188194wrm.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jul 2021 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RCf7HU9+h0boi26Ijeu8JR/HPkQzBEEGltQNvMgf/T4=;
        b=FF9c3oP4fSOjtBXWudp+d/RQZg8z/AWwTBWe8K8F5NZyF3qKA0/2hsr+TWIcnFkSVf
         YPoI8tKT5fjZ0WWYOCQ3lynR7Vh+CqfZp4LSlYS+0ELa6qplqF6mcT4/LRc56GXAcNNP
         vfpw53a07bD/JHosgLlUjHotaJ524f0pGLZ6VoONyvV2pFQ4T2uu6k20Qdfa0H36g7Tp
         3cRuGOFlAi114VCUkAj7w2fSDfSjWFQ4mE4ZMHBxqHPqUm71jOZMC0Js/zjmE+q8kQjk
         /o5cG2fRG7PyDVVyZH+guPyeW2g9eRmptmu4sKvRermgoUGiAuCq7d5n+4AFGzc9afWh
         z8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RCf7HU9+h0boi26Ijeu8JR/HPkQzBEEGltQNvMgf/T4=;
        b=PtbNkkmj2bn85iiR0weMVC9NRSRgnqaxP7hz0a32+fpDLNQ4jWFg/hxgMXXXtkF+b1
         +zHMeWxyTblYyMF5NOnOi96SMc84NISZyoNkWO6Fe8YpZ9LfQzvG4SIPUckucTQ7ow+F
         zAglLhF1egpFtHGfRW9gM0EGN81JTBdlKZ38ZjaskN6MGJvFu6F3L6eVH1sltA7CjTGn
         YhEXsHp0yxpEjcb0jS96Fqvsco9zII/xF9TVYRuCcL/ej74mWCHo5zN++OljpA7BPqUb
         ubszndbAT+8j6Jf2rX5ZHru46NZmEvaZvMvY67n84164SFNit4y1yf3oZbp3zb3E5ksv
         4smg==
X-Gm-Message-State: AOAM530DoAHRAyY4xy1H8Rgrg3R71AJLjnLDqzQtyrqm1vBZZ0uBGHds
	SN3+iC62fbQg1+X13usMUFPrVSXfKvn6LsYimZRdAA==
X-Google-Smtp-Source: ABdhPJwsBNY5id65Dr4bG9ULmIno/3mbBusPtS33nPthe4YlPkiKCNn1cr3rP2usTBCZFMeCSC6ndvN8C6qJhvNmg1Q=
X-Received: by 2002:a05:6000:1141:: with SMTP id d1mr268131wrx.396.1625649371503;
 Wed, 07 Jul 2021 02:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210706154256.3643237-1-ross.burton@arm.com> <20210706201046.GR1528@denix.org>
In-Reply-To: <20210706201046.GR1528@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 7 Jul 2021 10:16:00 +0100
Message-ID: <CAAnfSTs3nfnCm1vR7LPir2dLnEu+54Ud6kFJdTVix=Ad+U0h4w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-toolchain/armcompiler: fix checksums and installation on arm64
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Jul 2021 at 21:10, Denys Dmytriyenko <denis@denix.org> wrote:
> I see you have a patch file, but you also do a sed replacement in do_patch().
> I guess the sed replacement is generic enough to work w/o the patch file?
> Alternatively, would this shell line in the patch file work alone as well:

So I originally did a sed, then switched to a patch... and failed to
remove the sed.  <facepalm>

v2 incoming.

Ross
