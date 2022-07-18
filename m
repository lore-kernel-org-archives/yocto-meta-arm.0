Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E6CC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 17:00:43 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.29826.1658163641181370584
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 10:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=tdDgCE9Y;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id l11so9210252qvu.13
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hTpOFKO0SYthEoSPb0iHcfG9TC+Ylxdb1XtISGhvu2g=;
        b=tdDgCE9YKJvXPMKKYSYmBQUuDdck96FCFFG8FJ1VP4C89sUjt5xl3fwS7qNUcNT7fB
         kz0wIb5OAh89e4hmuBskzyGCsIK9fznLLlnf8NRmLAKG+7xTJ6RdYLpEdXy65pNXuPnR
         TG8dIeWsllT2ZwMvzumNaxAepeh/bFxrJxvFTb/nDco35ZXtTgY1tW2gu0NiwvK4GQBW
         8A7qV4HtYC/O8vvytcSgzRStuveXoDBIOgGoteXUY7owLDwjdvNWDMibhWpdSf1GYmNv
         7rjl294S3fzSx2wAiz4Jpjk6TpltQ/qc8UQrp8iPydLsZW1pdHC2JBMaeymFMdpDUCFe
         k+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hTpOFKO0SYthEoSPb0iHcfG9TC+Ylxdb1XtISGhvu2g=;
        b=TGPGvn0VpYgeDSgpdzOkbZX01lpYF5ESr7BVhYNDPmZwj8f3701NvhPs8QYBBSQM9D
         drXncfyQ2Ygd1ya/t3kwe0JKdfAFaAghAmMCe+GQqxy5oJ72AuXEW2CGr7Brgs2e5cPB
         VHWJ90zLYY2Ypi2UvEhWLM51XdUZUFRh9VK6AOE6APBYCKuo69lMh2jb/bziJr0sIfTU
         hc5NWAkI71INDfiCk+fzm1p6Dxom9LRTazxp656ZvZNuHtAHzH/ctgdg2ldsQ1iZlHHT
         mski7pX4sIToQmgPh03SapyW5AfFmHGotUVB26dnbvvlhbzuvE+Fs+0rx/3Fen4qkMsL
         BRsQ==
X-Gm-Message-State: AJIora+ZuNr0YX4f2bfteaWE+dUZs7/zv08LJc1Oq+La/RkR3ql1d6zT
	6ryxGoZ5szn5nGFzHB6wAedX1Q==
X-Google-Smtp-Source: 
 AGRyM1tTlnwVG14hHzzB5M4UgQVVbG6xXmC3wDIp3k/zXfIehxxMf1eiVDuQbDfVFKD2BdQBDTgPrA==
X-Received: by 2002:a05:6214:3010:b0:473:626a:5526 with SMTP id
 ke16-20020a056214301000b00473626a5526mr21967082qvb.1.1658163639575;
        Mon, 18 Jul 2022 10:00:39 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 y206-20020a3764d7000000b006b5652edb93sm11490794qkb.48.2022.07.18.10.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:00:39 -0700 (PDT)
Date: Mon, 18 Jul 2022 13:00:37 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, diego.sueiro@arm.com
Subject: Re: [PATCH] arm/lib: Improve FVPRunner shutdown logic
Message-ID: <YtWRtfxSngy27BpE@kudzu.us>
References: <20220718121533.3274181-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718121533.3274181-1-peter.hoyes@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Jul 2022 17:00:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3565

On Mon, Jul 18, 2022 at 01:15:33PM +0100, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Please can this be applied to master + kirkstone.

Applying to both master and kirkstone.

In the future, please add requests like this in the patch after the ---
Otherwise, it will get pulled into the commit message, and I have to
edit it out by hand.  Alternatively, you can send a second email with
"kirkstone" in the subject line after "PATCH" (and my scripts will
automatically pull it in).  Finally, you can just respond to the
initial email with a "and kirkstone too" and I'll do it manually then.

Thanks,
Jon

> 
> We have encountered intermittent hanging during FVP shutdown, so improve
> the termination logic by first issuing a terminate(), waiting a bit
> then, if necessary, issuing a kill().
> 
> Move returncode logic to after the telnet/pexpect cleanup so it
> actually runs.
> 
> Move pexpect.EOF logic into FVPRunner.stop so that it executes before
> closing the pexpect handle.
> 
> Issue-Id: SCM-4957
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Iebb3c3c89367256b1e116e66ffdb6b742358bce4
> ---
>  meta-arm/lib/fvp/runner.py           | 34 +++++++++++++++++++---------
>  meta-arm/lib/oeqa/controllers/fvp.py |  6 -----
>  2 files changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index 3b3fd00..7641cd6 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -72,24 +72,36 @@ class FVPRunner:
>  
>      async def stop(self):
>          if self._fvp_process:
> -            self._logger.debug(f"Killing FVP PID {self._fvp_process.pid}")
> +            self._logger.debug(f"Terminating FVP PID {self._fvp_process.pid}")
>              try:
>                  self._fvp_process.terminate()
> +                await asyncio.wait_for(self._fvp_process.wait(), 10.0)
> +            except asyncio.TimeoutError:
> +                self._logger.debug(f"Killing FVP PID {self._fvp_process.pid}")
> +                self._fvp_process.kill()
>              except ProcessLookupError:
>                  pass
>  
> -            if await self._fvp_process.wait() != 0:
> -                self._logger.info(f"FVP quit with code {self._fvp_process.returncode}")
> -                return self._fvp_process.returncode
> -            else:
> -                return 0
> -
>          for telnet in self._telnets:
> -            await telnet.terminate()
> -            await telnet.wait()
> +            try:
> +                telnet.terminate()
> +                await asyncio.wait_for(telnet.wait(), 10.0)
> +            except asyncio.TimeoutError:
> +                telnet.kill()
> +            except ProcessLookupError:
> +                pass
> +
> +        for console in self._pexpects:
> +            import pexpect
> +            # Ensure pexpect logs all remaining output to the logfile
> +            console.expect(pexpect.EOF, timeout=5.0)
> +            console.close()
>  
> -        for pexpect in self._pexpects:
> -            pexpect.close()
> +        if self._fvp_process and self._fvp_process.returncode:
> +            self._logger.info(f"FVP quit with code {self._fvp_process.returncode}")
> +            return self._fvp_process.returncode
> +        else:
> +            return 0
>  
>      async def run(self, until=None):
>          if until and until():
> diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/controllers/fvp.py
> index 30b6296..c8dcf29 100644
> --- a/meta-arm/lib/oeqa/controllers/fvp.py
> +++ b/meta-arm/lib/oeqa/controllers/fvp.py
> @@ -127,12 +127,6 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
>                  default_test_file = f"{name}_log{self.test_log_suffix}"
>                  os.symlink(default_test_file, self.bootlog)
>  
> -    async def _after_stop(self):
> -        # Ensure pexpect logs all remaining output to the logfile
> -        for terminal in self.terminals.values():
> -            terminal.expect(pexpect.EOF, timeout=5)
> -            terminal.close()
> -
>      def _get_terminal(self, name):
>          return self.terminals[name]
>  
> -- 
> 2.25.1
> 
> 

